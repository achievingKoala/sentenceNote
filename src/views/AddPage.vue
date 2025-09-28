<template>
  <div class="container">
    <input v-model="text" class="input" placeholder="输入内容" />
    <div class="buttons">
      <button @click="save" class="btn">保存</button>
      <button @click="speak" class="btn">发声</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'AddPage',
  data() {
    return {
      text: ''
    }
  },
  methods: {
    save() {
      console.log('保存:', this.text)
    },
    speak() {
      if (this.text) {
        speechSynthesis.speak(new SpeechSynthesisUtterance(this.text))
      }
    }
  }
}
</script>

<style scoped>
.container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100vh;
  gap: 20px;
}

.input {
  width: 300px;
  padding: 12px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.buttons {
  display: flex;
  gap: 10px;
}

.btn {
  padding: 10px 20px;
  font-size: 16px;
  border: none;
  border-radius: 4px;
  background: #007bff;
  color: white;
  cursor: pointer;
}

.btn:hover {
  background: #0056b3;
}
</style>