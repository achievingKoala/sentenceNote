<template>
  <div class="container">
    <textarea v-model="text" class="input" placeholder="输入英文" @input="translateText"></textarea>
    <div class="translate-container">
      <textarea v-model="text_zh" class="input" placeholder="中文翻译" ></textarea>
      <div v-if="isTranslating" class="loading-indicator">翻译中...</div>
    </div>
    <select v-model="selectedNotebook" class="dropdown" @change="onNotebookChange">
      <option value="">选择笔记本</option>
      <option v-for="notebook in notebooks" :key="notebook.id" :value="notebook.id">
        {{ notebook.name_zh }} - {{ notebook.name }}
      </option>
    </select>
    <div class="buttons">
      <button @click="save" class="btn">保存</button>
    </div>
    <div v-if="message" :class="['message', messageType]">
      {{ message }}
    </div>
  </div>
</template>

<script>
import { API_BASE_URL } from '../config.js'

export default {
  name: 'AddPage',
  data() {
    return {
      text: '',
      text_zh: '',
      notebooks: [],
      selectedNotebook: '',
      translateTimer: null,
      isTranslating: false,
      message: '',
      messageType: 'success'
    }
  },
  async mounted() {
    await this.fetchNotebooks()
  },
  methods: {
    async fetchNotebooks() {
      try {
        const response = await fetch(`${API_BASE_URL}/webhook/notebooks`)
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
        this.showMessage('请填写完整信息', 'error')
        return
      }
      
      try {
        const response = await fetch(`${API_BASE_URL}/webhook/createSentence`, {
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
          this.showMessage('保存成功', 'success')
          this.text = ''
          this.text_zh = ''
        } else {
          this.showMessage('保存失败', 'error')
        }
      } catch (error) {
        console.error('保存失败:', error)
        this.showMessage('保存失败', 'error')
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
          this.isTranslating = true
          try {
            const url = `https://api.mymemory.translated.net/get?q=${encodeURIComponent(this.text)}&langpair=en|zh`
            const response = await fetch(url)
            const data = await response.json()
            this.text_zh = data.responseData.translatedText
          } catch (error) {
            console.error('翻译失败:', error)
            this.text_zh = '翻译失败'
          } finally {
            this.isTranslating = false
          }
        } else {
          this.text_zh = ''
        }
      }, 500)
    },
    showMessage(text, type = 'success') {
      this.message = text
      this.messageType = type
      setTimeout(() => {
        this.message = ''
      }, 3000)
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

.translate-container {
  position: relative;
  width: 400px;
}

.loading-indicator {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: rgba(0, 123, 255, 0.9);
  color: white;
  padding: 8px 16px;
  border-radius: 4px;
  font-size: 14px;
  pointer-events: none;
}

.message {
  padding: 12px 20px;
  border-radius: 4px;
  margin-top: 10px;
  font-size: 14px;
  text-align: center;
  max-width: 400px;
}

.message.success {
  background: #d4edda;
  color: #155724;
  border: 1px solid #c3e6cb;
}

.message.error {
  background: #f8d7da;
  color: #721c24;
  border: 1px solid #f5c6cb;
}
</style>