<template>
  <div class="sentence-view">
    <div class="sentence-card" v-for="sentence in sentences" :key="sentence.id">
      <div class="sentence-header">
        <div class="sentence-text">{{ sentence.text }}</div>
      </div>
      <div class="sentence-text-zh">{{ sentence.text_zh }}</div>
      <div 
        class="sentence-input" 
        contenteditable="true"
        spellcheck="false"
        :data-placeholder="sentence.userInput ? '' : '输入英文句子...'"
        @input="updateInput($event, sentence)"
        @focus="currentFocusedSentence = sentence"
        :ref="'input-' + sentence.id"
      ></div>
      <button 
          class="speak-btn" 
          @click="speakSentence(sentence.text)" 
          :disabled="isSpeaking"
          title="发声 (快捷键: \\)"
        >
          {{ isSpeaking ? '播放中...' : '发声 (\\)' }}
        </button>
      <div v-if="isComplete(sentence)" class="correct-indicator">
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
    // 为每个句子添加 userInput 属性
    this.sentences.forEach(sentence => {
      if (!sentence.userInput) {
        sentence.userInput = ''
      }
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
      const sentenceWords = sentence.text.toLowerCase().split(/\W+/).filter(word => word.length > 0);
      // console.log(sentenceWords)
      // 高亮匹配的单词
      const words = text.split(/(\s+)/).map(word => {
        const cleanWord = word.trim().toLowerCase().replace(/[^a-zA-Z]/g, '');
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
    
    isComplete(sentence) {
      // console.log(sentence)
      if (!sentence.userInput) return false;
      const userText = sentence.userInput.toLowerCase().replace(/[^a-zA-Z\s]/g, '').trim();
      const originalText = sentence.text.toLowerCase().replace(/[^a-zA-Z\s]/g, '').trim();
      return userText === originalText;
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

.speak-btn {
  background: #007bff;
  color: white;
  border: none;
  font-size: 12px;
  cursor: pointer;
  padding: 6px 12px;
  border-radius: 4px;
  transition: all 0.2s;
  white-space: nowrap;
}

.speak-btn:hover:not(:disabled) {
  background-color: #0056b3;
}

.speak-btn:disabled {
  background-color: #6c757d;
  cursor: not-allowed;
  opacity: 0.7;
}

.sentence-text-zh {
  font-size: 14px;
  line-height: 1.5;
  color: #666;
  font-style: italic;
  margin-bottom: 16px;
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