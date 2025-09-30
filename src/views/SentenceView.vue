<template>
  <div class="sentence-view">
    <div class="control-bar">
      <button class="btn random-btn" @click="shuffleSentences">
        随机展示
      </button>
    </div>
    <div class="sentence-card" v-for="sentence in sentences" :key="sentence.id">
      <div class="sentence-header">
        <div class="sentence-text" v-show="sentence.showEnglish">{{ sentence.text }}</div>
      </div>
      <div class="sentence-text-zh">{{ sentence.text_zh }}</div>
      <div 
        class="sentence-input" 
        :contenteditable="!sentence.isComplete"
        spellcheck="false"
        :data-placeholder="sentence.userInput ? '' : '输入英文句子...'"
        @input="updateInput($event, sentence)"
        @focus="currentFocusedSentence = sentence"
        :ref="'input-' + sentence.id"
      ></div>
      <div class="button-group">
        <button 
          class="btn speak-btn" 
          @click="speakSentence(sentence.text)" 
          :disabled="isSpeaking"
          title="发声 (快捷键: \\)"
        >
          {{ isSpeaking ? '播放中...' : '发声' }} (快捷键: \)
        </button>
        <button 
          class="btn toggle-english-btn" 
          @click="toggleEnglish(sentence)"
          title="隐藏/显示英文 (快捷键: =)"
        >
          {{ sentence.showEnglish ? '隐藏英文' : '显示英文' }} (快捷键: =)
        </button>
        <button 
          class="btn like-btn" 
          :class="{ 'liked': sentence.is_liked }"
          :disabled="sentence.isLiking"
          @click="toggleLike(sentence)"
          title="收藏/取消收藏"
        >
          {{ sentence.isLiking ? '处理中...' : (sentence.is_liked ? '❤️ 已收藏' : '🤍 收藏') }}
        </button>
      <div class="usage-count">完成次数: {{ sentence.usage_count }}</div>

      </div>
      <div v-if="sentence.isComplete" class="correct-indicator">
        ✓ 正确！
      </div>
    </div>
  </div>
</template>

<script>
import { speakText } from './AzureTextToSpeech.js'

export default {
  name: 'SentenceView',
  props: {
    sentences: {
      type: Array,
      default: () => []
    }
  },
  data() {
    return {
      isSpeaking: false,
      currentFocusedSentence: null
    }
  },
  mounted() {
    // 为每个句子添加 userInput、showEnglish 和 isComplete 属性
    this.sentences.forEach(sentence => {
      if (!sentence.userInput) {
        sentence.userInput = ''
      }
      if (sentence.showEnglish === undefined) {
        sentence.showEnglish = false
      }
      sentence.isComplete = false
      sentence.isLiking = false
    })
    
    // 添加快捷键监听
    document.addEventListener('keydown', this.handleKeydown)
  },
  beforeUnmount() {
    document.removeEventListener('keydown', this.handleKeydown)
  },
  methods: {
    updateInput(event, sentence) {
      const editor = event.target;
      const text = editor.textContent;
      sentence.userInput = text;
      
      // 记录当前正在输入的句子
      this.currentFocusedSentence = sentence;
      
      // 保存光标位置
      const sel = window.getSelection();
      if (!sel.rangeCount) return;
      const range = sel.getRangeAt(0);
      const preCaretRange = range.cloneRange();
      preCaretRange.selectNodeContents(editor);
      preCaretRange.setEnd(range.endContainer, range.endOffset);
      const caretOffset = preCaretRange.toString().length;
      
      // 获取句子中的单词
      const sentenceWords = sentence.text.split(/\W+/).filter(word => word.length > 0);
      // console.log(sentenceWords)
      // 高亮匹配的单词
      const words = text.split(/(\s+)/).map(word => {
        const cleanWord = word.trim().replace(/[^a-zA-Z]/g, '');
        if (cleanWord && sentenceWords.includes(cleanWord)) {
          return `<span class="highlight">${word.replace(/ /g, '&nbsp;')}</span>`;
        }
        if (/^\s+$/.test(word)) {
          return word.replace(/ /g, '&nbsp;');
        }
        return word;
      });
      
      const html = words.join('');
      editor.innerHTML = html;
      
      // 恢复光标位置
      this.restoreCaret(editor, caretOffset);
      
      // 检查是否完成
      this.checkComplete(sentence);
    },
    
    restoreCaret(container, offset) {
      const range = document.createRange();
      const sel = window.getSelection();
      let currentOffset = 0;
      
      const traverse = (node) => {
        if (node.nodeType === Node.TEXT_NODE) {
          const len = node.textContent.length;
          if (currentOffset + len >= offset) {
            range.setStart(node, offset - currentOffset);
            range.collapse(true);
            sel.removeAllRanges();
            sel.addRange(range);
            throw 'done';
          } else {
            currentOffset += len;
          }
        } else {
          for (let child of node.childNodes) {
            traverse(child);
          }
        }
      };
      
      try {
        traverse(container);
      } catch (e) {
        // 捕获跳出
      }
    },
    
    async checkComplete(sentence) {
      if (!sentence.userInput) {
        sentence.isComplete = false;
        return;
      }
      const userText = sentence.userInput.replace(/[^a-zA-Z\s]/g, '').replace(/\s+/g, ' ').trim();
      const originalText = sentence.text.replace(/[^a-zA-Z\s]/g, '').replace(/\s+/g, ' ').trim();
      const wasComplete = sentence.isComplete;
      sentence.isComplete = userText === originalText;
      
      // 如果句子刚刚完成（之前未完成，现在完成），则播放成功音效并更新练习次数
      if (sentence.isComplete && !wasComplete) {
        this.playSuccessSound();
        await this.updateSentenceCount(sentence);
      }
    },
    
    async updateSentenceCount(sentence) {
      try {
        const response = await fetch('http://localhost:5678/webhook/addSentenceCount', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            sentenceId: sentence.id
          })
        });
        
        const result = await response.json();
        if (result.new_count !== undefined) {
          sentence.usage_count = result.new_count;
        }
      } catch (error) {
        console.error('Update sentence count error:', error);
      }
    },
    
    async speakSentence(text) {
      if (this.isSpeaking) return;
      
      this.isSpeaking = true;
      try {
        await speakText(text);
      } catch (error) {
        console.error('Speech error:', error);
      } finally {
        // 延迟重置状态，防止音频播放完成前就重置
        setTimeout(() => {
          this.isSpeaking = false;
        }, 1000);
      }
    },
    
    handleKeydown(event) {
      if (event.key === '\\' && !event.ctrlKey && !event.altKey && !event.metaKey) {
        event.preventDefault();
        // 播放当前正在输入的句子，如果没有则播放第一个句子
        const targetSentence = this.currentFocusedSentence || (this.sentences.length > 0 ? this.sentences[0] : null);
        if (targetSentence) {
          this.speakSentence(targetSentence.text);
        }
      }
      
      if (event.key === '=' && !event.ctrlKey && !event.altKey && !event.metaKey) {
        event.preventDefault();
        if (this.currentFocusedSentence) {
          this.toggleEnglish(this.currentFocusedSentence);
        }
      }
    },
    
    toggleEnglish(sentence) {
      sentence.showEnglish = !sentence.showEnglish;
    },
    
    async toggleLike(sentence) {
      if (sentence.isLiking) return;
      
      sentence.isLiking = true;
      try {
        const response = await fetch('http://localhost:5678/webhook/toggleLike', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            sentence_id: sentence.id
          })
        });
        
        const result = await response.json();
        if (result.success) {
          sentence.is_liked = result.liked;
        }
      } catch (error) {
        console.error('Toggle like error:', error);
      } finally {
        sentence.isLiking = false;
      }
    },
    
    shuffleSentences() {
      for (let i = this.sentences.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [this.sentences[i], this.sentences[j]] = [this.sentences[j], this.sentences[i]];
      }
    },
    
    playSuccessSound() {
      try {
        const audio = new Audio('/sentence-app/success.mp3');
        audio.play().catch(error => {
          console.error('播放成功音效失败:', error);
        });
      } catch (error) {
        console.error('创建音频对象失败:', error);
      }
    }
  }
}
</script>

<style>
.sentence-view {
  padding: 20px;
  max-width: 800px;
  margin: 0 auto;
}

.control-bar {
  display: flex;
  justify-content: center;
  margin-bottom: 20px;
}

.random-btn {
  background: #6f42c1;
}

.random-btn:hover {
  background-color: #5a32a3;
}

.sentence-card {
  background: white;
  border-radius: 8px;
  padding: 20px;
  margin-bottom: 16px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  border: 1px solid #e0e0e0;
}

.sentence-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 12px;
}

.sentence-text {
  font-size: 16px;
  line-height: 1.6;
  color: #333;
  flex: 1;
}

.button-group {
  display: flex;
  gap: 8px;
  margin-top: 12px;
}

.btn {
  border: none;
  font-size: 12px;
  cursor: pointer;
  padding: 6px 12px;
  border-radius: 4px;
  transition: all 0.2s;
  white-space: nowrap;
  color: white;
}

.speak-btn {
  background: #007bff;
}

.speak-btn:hover:not(:disabled) {
  background-color: #0056b3;
}

.speak-btn:disabled {
  background-color: #6c757d;
  cursor: not-allowed;
  opacity: 0.7;
}

.toggle-english-btn {
  background: #28a745;
}

.toggle-english-btn:hover {
  background-color: #218838;
}

.like-btn {
  background: #0d528e;
}

.like-btn:hover {
  background-color: #5a6268;
}

.like-btn.liked {
  background: #dc3545;
}

.like-btn.liked:hover {
  background-color: #c82333;
}

.sentence-text-zh {
  font-size: 14px;
  line-height: 1.5;
  color: #666;
  font-style: italic;
  margin-bottom: 8px;
}

.usage-count {
  font-size: 12px;
  color: #230404;
  padding: 6px 12px;
}

.sentence-input {
  width: 100%;
  padding: 12px;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 14px;
  outline: none;
  transition: border-color 0.2s;
  min-height: 20px;
  white-space: pre-wrap;
  word-break: break-word;
}

.sentence-input[contenteditable="false"] {
  background-color: #f8f9fa;
  cursor: not-allowed;
  opacity: 0.8;
}

.sentence-input:focus {
  border-color: #007bff;
}

.sentence-input[data-placeholder]:empty::before {
  content: attr(data-placeholder);
  color: #999;
  pointer-events: none;
}

.sentence-input .highlight {
  color: green;
}

.correct-indicator {
  margin-top: 8px;
  color: #28a745;
  font-weight: bold;
  font-size: 14px;
}
</style>