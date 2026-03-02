# sentence-app

一个基于Vue 3的英语句子学习应用，帮助用户通过输入练习来学习和记忆英语句子。

## 功能特性

### 主界面布局
- **侧边栏导航**：左侧显示笔记本列表，包括"全部句子"和各个分类笔记本
- **主内容区**：根据选择显示添加页面或句子练习页面

### 句子练习功能（SentenceView组件）
- **实时输入高亮**：使用contenteditable输入框，通过updateInput方法实时检测输入，匹配的单词显示绿色高亮
- **智能完成检测**：checkComplete方法比较用户输入与原文，完成时触发成功音效和计数更新
- **语音播放**：speakSentence方法调用Azure TTS，支持按钮点击和`\`快捷键触发
- **英文显示切换**：toggleEnglish方法控制sentence.showEnglish状态，支持`=`快捷键
- **收藏管理**：toggleLike方法异步调用API更新收藏状态，按钮显示加载状态
- **光标位置保持**：restoreCaret方法在高亮更新后恢复光标位置
- **焦点跟踪**：currentFocusedSentence记录当前输入的句子，用于快捷键操作

### 数据管理（SentenceView组件）
- **动态排序**：sortAsc/sortDesc方法切换sortOrder状态，filteredSentences计算属性实时排序
- **随机打乱**：shuffleSentences方法使用Fisher-Yates算法原地打乱sentences数组
- **分页控制**：paginatedSentences计算属性基于currentPage和pageSize切片数据
- **收藏筛选**：toggleFavoritesOnly切换showFavoritesOnly状态，filteredSentences响应式过滤
- **状态管理**：每个句子动态添加userInput、showEnglish、isComplete等响应式属性

### 添加句子功能
- **双语输入**：输入英文句子，自动翻译为中文
- **笔记本分类**：选择句子所属的笔记本分类
- **实时翻译**：使用MyMemory API自动翻译英文到中文
- **数据验证**：确保所有字段填写完整后才能保存

### 交互体验（SentenceView组件）
- **全局快捷键**：handleKeydown方法监听键盘事件，`\`播放语音，`=`切换英文显示
- **实时视觉反馈**：输入时单词匹配显示绿色highlight类，完成时显示correct-indicator
- **音效系统**：playSuccessSound方法播放success.mp3，完成句子时自动触发
- **按钮状态管理**：isSpeaking、isLiking等状态控制按钮禁用和文本变化
- **防抖处理**：语音播放有1秒延迟重置，防止重复触发

## Recommended IDE Setup

[VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur).

## Customize configuration

See [Vite Configuration Reference](https://vite.dev/config/).

## Project Setup

```sh
npm install
```

### Compile and Hot-Reload for Development

```sh
npm run dev
```

### Compile and Minify for Production

```sh
npm run build
```

### Run Unit Tests with [Vitest](https://vitest.dev/)

```sh
npm run test:unit
```

## API 依赖

应用需要后端API支持以下功能：
- 获取笔记本列表：`GET /notebooks`
- 获取句子列表：`GET /sentenceStatsByNotebookId`
- 创建新句子：`POST /createSentence`
- 更新练习次数：`POST /addSentenceCount`
- 切换收藏状态：`POST /toggleLike`

## 技术栈

- **前端框架**：Vue 3 + Vite
- **语音合成**：Azure Text-to-Speech API
- **翻译服务**：MyMemory Translation API
- **样式**：原生CSS
- **状态管理**：Vue 3 Composition API