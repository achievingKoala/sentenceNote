<template>
  <div class="sentence-view">
    <div class="sentence-card" v-for="sentence in sentences" :key="sentence.id">
      <div class="sentence-text">{{ sentence.text }}</div>
      <div class="sentence-text-zh">{{ sentence.text_zh }}</div>
      <input 
        type="text" 
        class="sentence-input" 
        placeholder="输入你的理解或笔记..."
        v-model="sentence.userInput"
      />
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
        this.$set(sentence, 'userInput', '')
      }
    })
  }
}
</script>

<style scoped>
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
}

.sentence-input:focus {
  border-color: #007bff;
}
</style>