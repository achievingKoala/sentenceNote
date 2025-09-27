<template>
  <div class="app">
    <div class="sidebar">
      <div class="menu-item active" @click="currentView = 'AddPage'">
        添加页面
      </div>
    </div>
    <div class="main-content">
      <AddPage v-if="currentView === 'AddPage'" />
    </div>
  </div>
</template>

<script>
import AddPage from './views/AddPage.vue'

export default {
  name: 'App',
  components: {
    AddPage
  },
  data() {
    return {
      currentView: 'AddPage'
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

.main-content {
  flex: 1;
}
</style>