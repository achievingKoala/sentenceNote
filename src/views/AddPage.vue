<template>
  <div class="container">
    <textarea v-model="text" class="input" placeholder="输入英文" @input="translateText"></textarea>
    <textarea v-model="text_zh" class="input" placeholder="中文翻译" readonly></textarea>
    <select v-model="selectedNotebook" class="dropdown" @change="onNotebookChange">
      <option value="">选择笔记本</option>
      <option v-for="notebook in notebooks" :key="notebook.id" :value="notebook.id">
        {{ notebook.name_zh }} - {{ notebook.name }}
      </option>
    </select>
    <div class="buttons">
      <button @click="save" class="btn">保存</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'AddPage',
  data() {
    return {
      text: '',
      text_zh: '',
      notebooks: [],
      selectedNotebook: '',
      translateTimer: null
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
    async save() {
      if (!this.text.trim() || !this.text_zh.trim() || !this.selectedNotebook) {
        alert('请填写完整信息')
        return
      }
      
      try {
        const response = await fetch('http://localhost:5678/webhook/createSentence', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            text: this.text.trim(),
            text_zh: this.text_zh.trim(),
            notebook_id: this.selectedNotebook
          })
        })
        
        if (response.ok) {
          alert('保存成功')
          this.text = ''
          this.text_zh = ''
        } else {
          alert('保存失败')
        }
      } catch (error) {
        console.error('保存失败:', error)
        alert('保存失败')
      }
    },
    speak() {
      if (this.text) {
        speechSynthesis.speak(new SpeechSynthesisUtterance(this.text))
      }
    },
    translateText() {
      if (this.translateTimer) {
        clearTimeout(this.translateTimer)
      }
      this.translateTimer = setTimeout(async () => {
        if (this.text.trim()) {
          try {
            const url = `https://api.mymemory.translated.net/get?q=${encodeURIComponent(this.text)}&langpair=en|zh`
            const response = await fetch(url)
            const data = await response.json()
            this.text_zh = data.responseData.translatedText
          } catch (error) {
            console.error('翻译失败:', error)
            this.text_zh = '翻译失败'
          }
        } else {
          this.text_zh = ''
        }
      }, 500)
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
  width: 400px;
  height: 120px;
  padding: 24px 16px;
  font-size: 18px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
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