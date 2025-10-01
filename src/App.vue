<template>
  <div class="app">
    <div class="sidebar">
      <div class="menu-item" :class="{ active: currentView === 'AddPage' }" @click="currentView = 'AddPage'">
        添加页面
      </div>
      <div 
        v-for="notebook in notebooks" 
        :key="notebook.id" 
        class="menu-item" 
        :class="{ active: currentView === `notebook-${notebook.id}` }"
        @click="selectNotebook(notebook.id)"
      >
        <div class="notebook-title">{{ notebook.name_zh }}</div>
        <div class="notebook-subtitle">{{ notebook.name }}</div>
      </div>
    </div>
    <div class="main-content">
      <AddPage v-if="currentView === 'AddPage'" />
      <SentenceView v-else :sentences="currentSentences" :key="currentView" />
    </div>
  </div>
</template>

<script>
import AddPage from './views/AddPage.vue'
import SentenceView from './views/SentenceView.vue'

export default {
  name: 'App',
  components: {
    AddPage,
    SentenceView
  },
  data() {
    return {
      currentView: 'AddPage',
      notebooks: [],
      currentSentences: []
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
      } catch (error) {
        console.error('获取笔记本列表失败:', error)
      }
    },
    async selectNotebook(notebookId) {
      this.currentView = `notebook-${notebookId}`
      try {
        const response = await fetch(`http://localhost:5678/webhook/sentenceStatsByNotebookId?notebookId=${notebookId}`)
        this.currentSentences = await response.json()
      } catch (error) {
        console.error('获取句子失败:', error)
        this.currentSentences = []
      }
    }
  }
}
</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.app {
  display: flex;
  height: 100vh;
}

.sidebar {
  width: 200px;
  background: #f5f5f5;
  border-right: 1px solid #ddd;
  padding: 20px 0;
}

.menu-item {
  padding: 12px 20px;
  cursor: pointer;
  border-bottom: 1px solid #eee;
}

.menu-item:hover {
  background: #e9e9e9;
}

.menu-item.active {
  background: #007bff;
  color: white;
}

.notebook-title {
  font-weight: bold;
  margin-bottom: 4px;
}

.notebook-subtitle {
  font-size: 12px;
  opacity: 0.8;
}

.main-content {
  flex: 1;
}
</style>