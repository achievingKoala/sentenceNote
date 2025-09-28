1 AddPage.vue 一个网页，输入框居中，下面一个保存按钮，一个发声按钮
    - 输入框大一些
2 一个侧边栏，默认显示AddPage
3 新增的侧边栏按接口动态显示返回数据中的zh_name 和 name(作为副标题) 。
http://localhost:5678/webhook/notebooks
数据格式
    [
    {
    "id": 
    1,
    "name": 
    "Counter Narratives",
    "name_zh": 
    "反叙事"
    },
    {
    "id": 
    2,
    "name": 
    "Matters Ontological",
    "name_zh": 
    "本体论问题"
    },
    {
    "id": 
    3,
    "name": 
    "The Sacred and the Profane",
    "name_zh": 
    "神圣与世俗"
    },
    {
    "id": 
    4,
    "name": 
    "Chance, Success, Happiness, and Stoicism",
    "name_zh": 
    "机遇、成功、幸福与斯多葛主义"
    },
    {
    "id": 
    5,
    "name": 
    "Charming and Less Charming Sucker Problems",
    "name_zh": 
    "迷人或不那么迷人的“傻瓜问题”"
    }
    ]

4. 点击侧边栏时
请求
http://localhost:5678/webhook/allSentencesByNoteBookId?notebookId=

--
1 卡片显示
2 关键词显示
3 实时提醒
4 查看原句
5 随机显示
6 顺序显示