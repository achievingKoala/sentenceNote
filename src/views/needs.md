### 1. AddPage.vue 
一个网页，输入框居中，下面一个保存按钮
   - 输入框大一些
### 2. 一个侧边栏，默认显示AddPage

### 3. 新增的侧边栏按接口动态显示返回数据中的
 zh_name 和 name(作为副标题)

- http://localhost:5678/webhook/notebooks
- 数据格式
```json
[
  {
    "id": 1,
    "name": "Counter Narratives",
    "name_zh": "反叙事"
  },
  {
    "id": 2,
    "name": "Matters Ontological",
    "name_zh": "本体论问题"
  }
]
```

### 4. 点击侧边栏时
请求 http://localhost:5678/webhook/sentenceStatsByNotebookId?notebookId={$notebook_id}

- 页面上处理请求响应数据
````json
[
   {
       "id": 30,
       "text": "The person you are the most afraid to contradict is yourself.",
       "usage_count": 0,
       "text_zh": "你最害怕反驳的人，是你自己。",
       "notebook_id": 22,
       "is_liked": false
   },
   {
       "id": 31,
       "text": "An idea starts to be interesting when you get scared of taking it to its logical conclusion.",
       "usage_count": 0,
       "text_zh": "当一个想法令你害怕将其推向逻辑的终点时，它才开始变得有趣。",
       "notebook_id": 22,
       "is_liked": false
   }
]
````

1 卡片显示
 - text, text_zh
 - input 框 输入的单词如果在 text 中，该单词在输入框中显示绿色，否则是黑色 
 - 全部句子输入后显示正确 
 - play sound 发声按钮 利用 AzureTextToSpeech.js 显示文字:播放中... 快捷键 \ 防止反复按键
 - 隐藏/显示英文按钮 快捷键 ：= 
 - 随机展示
 - todo 随机后收藏禁用取消
 - 展示 添加收藏/取消收藏 按钮 （is_liked）
 ```
 {
       "id": 31,
       "text": "An idea starts to be interesting when you get scared of taking it to its logical conclusion.",
       "usage_count": 0,
       "text_zh": "当一个想法令你害怕将其推向逻辑的终点时，它才开始变得有趣。",
       "notebook_id": 22,
       "is_liked": false
}
```
 - todo 收藏按钮 快捷键 
- 收藏接口:http://localhost:5678/webhook/toggleLike
  request body:
```
   {
   "sentence_id": 44
   }
```
   "responseBody": "  
   {{ { \"success\": true, \"liked\": true, \"message\": \"Liked successfully\" } }}",
   
   or
   
   {{ { \"success\": true, \"liked\": false, \"message\": \"Unliked successfully\" } }}",
   
   
 - 发送请求时按钮要禁用
 - 展示完成次数： usage_count
 - 完成次数修改接口：
 post: http://localhost:5678/webhook/addSentenceCount
   -  request body {
   sentenceId:
   userId:
 }
   - response body
{
    "user_id": 1,
    "sentence_id": 36,
    "new_count": 1
}
 - todo-done 空列表什么都不展示
 - todo-done 中文可编辑
 - todo-done 字体变大一点
 - todo 空格如何明显？
 

2. SentenceView.vue 
- 前端 分页 默认 5 条
- todo-done 翻页时页码重置
```
<SentenceView v-else :sentences="currentSentences" :key="currentView" />
```
- todo-done 仅显示收藏 按钮
- todo-done 根据练习次数正序，倒序
- todo 随机当前页面
todo-done 侧边栏变宽
- todo 颜色风格统一
- todo queryAll


2 关键词显示
3 实时提醒
4 查看原句
5 随机显示
6 顺序显示

----
## 增加句子功能
1. AddPage.vue  加一个下拉框 内容来自接口 - http://localhost:5678/webhook/notebooks
2. AddPage.vue 加一个输入框，用户输入英文后自动翻译成中文
3. AddPage.vue 保存按钮触发这个接口：
http://localhost:5678/webhook/createSentence
```
"body": {
   "text": 
   "text_zh": 
   "notebook_id": ,
   },
```
4 AddPage.vue 添加成功后不要alert 提醒， 翻译接口请求时页面上有一个加载标志