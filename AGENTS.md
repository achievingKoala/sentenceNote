# Agent 项目说明

## 当前状态

这个项目已经从原来的 Vue/Vite 应用改成了 HTML 单页应用。

当前主实现文件是：

- `new-single/index.html`

仓库里还保留了一个较旧的 HTML 快照：

- `sentence-app.html`

`src/` 目录下的 Vue/Vite 代码，以及根目录的 `index.html`、`vite.config.js`、相关 npm scripts，目前都应视为旧版本或参考代码。除非用户明确要求修改 Vue 版本，否则优先处理 HTML 单页版本。

## 当前前端技术栈

当前应用是静态 HTML 页面，使用：

- CDN 引入的 Tailwind CSS
- CDN 引入的 jQuery
- 普通 JavaScript 管理状态和渲染 DOM
- 浏览器原生 `fetch` 调用后端 API

日常使用 HTML 版本时，不需要 Vue、Vite，也不需要构建步骤。

## 主要功能

这是一个英语句子练习工具。

核心流程：

- 页面启动后加载笔记本列表。
- 默认使用 notebook id `-1` 加载全部句子。
- 点击左侧笔记本后，加载该笔记本下的句子。
- 添加页面可以输入英文句子、自动翻译中文、选择笔记本并保存。
- 练习页面根据中文提示输入英文句子。
- 输入过程中会高亮匹配到的单词。
- 当输入内容与目标英文句子完全一致时，播放成功音效，并更新该句子的练习次数。

练习页面支持：

- 按练习次数升序/降序排序。
- 随机打乱当前页。
- 仅显示收藏句子。
- 分页。
- 显示/隐藏英文句子。
- 使用 Azure TTS 播放句子音频。
- 收藏/取消收藏句子。

快捷键：

- `\`：播放当前聚焦句子的音频。
- `=`：显示或隐藏当前聚焦句子的英文。

## 后端 API

当前 HTML 应用使用这些接口：

- `https://notebook-back-ldu7.onrender.com/notebooks`
- `https://notebook-back-ldu7.onrender.com/sentenceStatsByNotebookId?notebookId=...`
- `https://notebook-back-ldu7.onrender.com/createSentence`
- `https://notebook-back-ldu7.onrender.com/addSentenceCount`
- `https://notebook-back-ldu7.onrender.com/toggleLike`

旧 Vue 代码里使用过 `/webhook/...` 路径。处理 HTML 版本时，不要默认沿用旧的 `/webhook/...` 接口。

## 重要注意事项

- `new-single/index.html` 看起来是当前最新的应用文件。
- 如果部署 HTML 版本，需要确保部署入口指向 `new-single/index.html`，或者把该文件迁移/复制为根目录的 `index.html`。
- 根目录的 `index.html` 仍然是旧 Vite 入口，会挂载 Vue 应用。
- Azure TTS 和其他外部 API key 目前直接写在前端代码里，不适合公开生产部署。
- HTML 应用依赖网络访问 CDN、翻译接口、后端接口和 Azure TTS。
- `src/sql/` 存放数据库建表和种子数据。
- `n8n-json/` 存放后端自动化/API 层的 n8n workflow 导出文件。

## 已知后续事项

需要确认 `new-single/index.html` 里的保存按钮是否已经绑定到 `saveSentence()`。函数已经存在，但 `bindEvents()` 中应包含：

```js
$('#saveBtn').click(saveSentence);
```
