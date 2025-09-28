<template>
  <div class="sentence-view">
    <div class="sentence-card" v-for="sentence in sentences" :key="sentence.id">
      <div class="sentence-text">{{ sentence.text }}</div>
      <div class="sentence-text-zh">{{ sentence.text_zh }}</div>
      <div 
        class="sentence-input" 
        contenteditable="true"
        spellcheck="false"
        :data-placeholder="sentence.userInput ? '' : '输入英文句子...'"
        @input="updateInput($event, sentence)"
        :ref="'input-' + sentence.id"
      ></div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'SentenceView',
  props: {
    sentences: {
      type: Array,
      default: () => []
    }
  },
  mounted() {
    // 为每个句子添加 userInput 属性
    this.sentences.forEach(sentence => {
      if (!sentence.userInput) {
        sentence.userInput = ''
      }
    })
  },
  methods: {
    updateInput(event, sentence) {
      const editor = event.target;
      const text = editor.textContent;
      sentence.userInput = text;
      
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
        console.log(cleanWord)
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

.sentence-text {
  font-size: 16px;
  line-height: 1.6;
  color: #333;
  margin-bottom: 12px;
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
</style>