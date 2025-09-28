<template>
  <div class="container">
    <select v-model="selectedNotebook" class="dropdown" @change="onNotebookChange">
      <option value="">选择笔记本</option>
      <option v-for="notebook in notebooks" :key="notebook.id" :value="notebook.id">
        {{ notebook.name_zh }} - {{ notebook.name }}
      </option>
    </select>
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
      text: '',
      notebooks: [],
      selectedNotebook: ''
    }
  },
  async mounted() {
    await this.fetchNotebooks()
  },
  methods: {
    async fetchNotebooks() {
      try {
        const response = await fetch('http://localhost:5678/webhook/notebooks')
        this.notebooks = await response.json()
        const firstNotebook = this.notebooks.find(nb => nb.name === 'first')
        if (firstNotebook) {
          this.selectedNotebook = firstNotebook.id
        }
      } catch (error) {
        console.error('获取笔记本失败:', error)
      }
    },
    onNotebookChange() {
      console.log('选择的笔记本ID:', this.selectedNotebook)
    },
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

.dropdown {
  width: 324px;
  padding: 12px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 4px;
  margin-bottom: 10px;
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