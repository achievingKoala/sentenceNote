create table public.sentences (
  id serial not null,
  text text not null,
  count integer not null default 0,
  text_zh text null,
  notebook_id integer null,
  is_favorite boolean not null default false,
  constraint sentences_pkey primary key (id)
) TABLESPACE pg_default;

insert into public.sentences (text, text_zh, notebook_id) values ('The person you are the most afraid to contradict is yourself.', '你最害怕反驳的人，是你自己。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('An idea starts to be interesting when you get scared of taking it to its logical conclusion.', '当一个想法令你害怕将其推向逻辑的终点时，它才开始变得有趣。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Pharmaceutical companies are better at inventing diseases that match existing drugs, rather than inventing drugs to match existing diseases.', '制药公司更擅长发明与现有药物相匹配的疾病，而不是发明与现有疾病相匹配的药物。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('To understand the liberating effect of asceticism, consider that losing all your fortune is much less painful than losing only half of it.', '要理解禁欲的解放力量，想想失去全部财富比只失去一半要少痛苦得多。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('To bankrupt a fool, give him information.', '要让一个傻瓜破产，就给他信息。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Academia is to knowledge what prostitution is to love; close enough on the surface but, to the nonsucker, not exactly the same thing.', '学术之于知识，如同卖淫之于爱情；表面上相似，对明白人来说却完全不同。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('In science you need to understand the world; in business you need others to misunderstand it.', '在科学中，你需要理解世界；在商业中，你需要别人误解世界。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('I suspect that they put Socrates to death because there is something terribly unattractive, alienating, and nonhuman in thinking with too much clarity.', '我怀疑他们处死苏格拉底，是因为过于清晰的思考令人反感、疏远、甚至不近人情。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Education makes the wise slightly wiser, but it makes the fool vastly more dangerous.', '教育让智者略微更聪明，却让愚者危险得多。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('The test of originality for an idea is not the absence of one single predecessor but the presence of multiple but incompatible ones.', '衡量一个想法是否原创的标准，不是它没有前人，而是它有多个互不相容的前人。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Modernity''s double punishment is to make us both age prematurely and live longer.', '现代性的双重惩罚是让我们既早衰又长寿。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('An erudite is someone who displays less than he knows; a journalist or consultant, the opposite.', '博学者展示的知识少于他所知道的；记者或顾问则恰恰相反。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Your brain is most intelligent when you don''t instruct it on what to do—something people who take showers discover on occasion.', '当你不告诉大脑该做什么时，它最聪明——洗澡的人偶尔会发现这一点。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('If your anger decreases with time, you did injustice; if it increases, you suffered injustice.', '如果你的愤怒随时间减弱，你曾加害别人；如果愤怒随时间增强，你曾被加害。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('I wonder if those who advocate generosity for its rewards notice the inconsistency, or if what they call generosity is an attractive investment strategy.', '我想知道，那些因回报而提倡慷慨的人是否意识到矛盾，或者他们所谓的慷慨其实是一种诱人的投资策略。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Those who think religion is about "belief" don''t understand religion, and don''t understand belief.', '认为宗教是关于“信仰”的人，既不懂宗教，也不懂信仰。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Work destroys your soul by stealthily invading your brain during the hours not officially spent working; be selective about professions.', '工作通过在非工作时间悄悄入侵你的大脑来摧毁你的灵魂；选择职业时要谨慎。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('In nature we never repeat the same motion; in captivity (office, gym, commute, sports), life is just repetitive stress injury. No randomness.', '在自然中，我们从不重复同一动作；在囚禁中（办公室、健身房、通勤、运动），生活只是重复性劳损，没有随机性。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Using, as an excuse, others'' failure of common sense is in itself a failure of common sense.', '把他人的常识缺失当作借口，本身就是常识的缺失。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Compliance with the straitjacket of narrow (Aristotelian) logic and avoidance of fatal inconsistencies are not the same thing.', '遵循狭隘（亚里士多德式）逻辑的紧身衣，与避免致命矛盾，并不是同一回事。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Economics cannot digest the idea that the collective (and the aggregate) are disproportionately less predictable than individuals.', '经济学无法消化这样一个事实：集体（或总体）的可预测性远低于个体。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Don''t talk about "progress" in terms of longevity, safety, or comfort before comparing zoo animals to those in the wilderness.', '在将动物园的动物与野外的动物进行比较之前，不要用寿命、安全或舒适来谈论“进步”。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('If you know, in the morning, what your day looks like with any precision, you are a little bit dead—the more precision, the more dead you are.', '如果你早上就能精确知道自己的一天会怎样，你就已经有点死了——越精确，越死。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('There is no intermediate state between ice and water but there is one between life and death: employment.', '冰与水之间没有中间态，但生与死之间有一种：就业。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('You have a calibrated life when most of what you fear has the titillating prospect of adventure.', '当你恐惧的大多数事都带着刺激的冒险意味时，你的生活才算被校准。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Procrastination is the soul rebelling against entrapment.', '拖延是灵魂对束缚的反抗。', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Nobody wants to be perfectly transparent; not to others, certainly not to himself.', '没人想做到完全透明；对别人不想，对自己更不想。', 22);


insert into public.sentences (text, text_zh, notebook_id) values ('The best revenge on a liar is to convince him that you believe what he said.', '对付说谎者的最佳报复，就是让他相信你相信了他的话。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('When we want to do something while unconsciously certain to fail, we seek advice so we can blame someone else for the failure.', '当我们潜意识里确信会失败时，就会寻求建议，好在失败后能怪别人。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('It is harder to say no when you really mean it than when you don''t.', '当你真的想拒绝时，说“不”比假装拒绝更难。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('Never say no twice if you mean it.', '如果你是认真的，就不要第二次说“不”。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('Your reputation is harmed the most by what you say to defend it.', '最损害你名誉的，往往是你为捍卫它所说的话。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('The only objective definition of aging is when a person starts to talk about aging.', '衰老唯一客观的定义，是一个人开始谈论衰老。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('They will envy you for your success, for your wealth, for your intelligence, for your looks, for your status—but rarely for your wisdom.', '人们会嫉妒你的成功、财富、聪明、外貌和地位——却很少嫉妒你的智慧。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('Most of what they call humility is successfully disguised arrogance.', '他们所谓的“谦虚”，多半是成功伪装的傲慢。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('If you want people to read a book, tell them it is overrated.', '如果你想让人读一本书，就说它被高估了。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('You never win an argument until they attack your person.', '只有当对方开始攻击你本人时，你才赢得了争论。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('Nothing is more permanent than "temporary" arrangements, deficits, truces, and relationships; and nothing is more temporary than "permanent" ones.', '没有什么比“临时”的安排、赤字、停战与关系更持久；也没有什么比“永久”的更短暂。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('The most painful moments are not those we spend with uninteresting people; rather, they are those spent with uninteresting people trying hard to be interesting.', '最痛苦的时刻不是与无趣的人在一起，而是与那些拼命想显得有趣的无趣之人共处。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('Hatred is love with a typo somewhere in the computer code, correctable but very hard to find.', '仇恨是爱情代码中的一个错字，可以修复，但极难发现。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('I wonder whether a bitter enemy would be jealous if he discovered that I hated someone else.', '我想知道，如果一个死敌发现我恨上了别人，他会不会嫉妒。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('The characteristic feature of the loser is to bemoan, in general terms, mankind''s flaws, biases, contradictions, and irrationality—without exploiting them for fun and profit.', '失败者的典型特征，是泛泛地哀叹人类的缺陷、偏见、矛盾与非理性——而不是利用这些去获利或取乐。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('The test of whether you really liked a book is if you reread it (and how many times); the test of whether you really liked someone''s company is if you are ready to meet him again and again—the rest is spin, or that variety of sentiment now called self-esteem.', '判断你是否真喜欢一本书的标准是你是否重读它（以及重读几次）；判断你是否真喜欢某人的陪伴，是你是否愿意一再与他相见——其他都是自我安慰，或如今所谓的“自尊”。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('We ask "why is he rich (or poor)?" not "why isn''t he richer (or poorer)?"; "why is the crisis so deep?" not "why isn''t it deeper?"', '我们问“他为何富（或穷）？”，却不问“他为何不更富（或更穷）？”；问“危机为何如此严重？”，却不问“为何不更严重？”。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('Hatred is much harder to fake than love. You hear of fake love; never of fake hate.', '仇恨比爱情更难伪装。你会听说假爱，却从未听说假恨。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('The opposite of manliness isn''t cowardice; it''s technology.', '男子气概的对立面不是懦弱，而是科技。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('Usually, what we call a "good listener" is someone with skillfully polished indifference.', '我们所谓的“好听众”，往往只是擅长伪装冷漠的人。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('It is the appearance of inconsistency, and not its absence, that makes people attractive.', '让人有魅力的，不是绝对一致，而是表面的矛盾。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('You remember emails you sent that were not answered better than emails that you did not answer.', '你更容易记得那些未被回复的邮件，而不是你未回复的邮件。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('People reserve standard compliments for those who do not threaten their pride; the others they often praise by calling "arrogant."', '人们把标准的赞美留给不威胁自己自尊的人；对那些让他们感到压力的人，他们往往用“傲慢”来赞美。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('Since Cato the Elder, a certain type of maturity has shown up when one starts blaming the new generation for "shallowness" and praising the previous one for its "values."', '自老加图以来，一种成熟的标志就是开始指责年轻一代“浅薄”，并赞美上一代的“价值观”。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('It is as difficult to avoid bugging others with advice on how to exercise and other health matters as it is to stick to an exercise schedule.', '要避免用健康建议打扰别人，和坚持健身计划一样难。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('By praising someone for his lack of defects you are also implying his lack of virtues.', '当你称赞某人“没有缺点”时，也暗示他“没有优点”。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('When she shouts that what you did was unforgivable, she has already started to forgive you.', '当她喊着“你做的事不可原谅”时，其实已经开始原谅你了。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('Being unimaginative is only a problem when you are easily bored.', '缺乏想象力只有在你容易无聊时才是问题。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('We call narcissistic those individuals who behave as if they were the central residents of the world; those who do exactly the same in a set of two we call lovers or, better, "blessed by love."', '我们称那些自以为世界中心的人为自恋者；但当这种行为发生在两人之间时，我们称他们为恋人，或更好听的，“被爱眷顾的人”。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('Friendship that ends was never one; there was at least one sucker in it.', '会结束的友谊从来不是真友谊；其中至少有一个人是傻瓜。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('Most people fear being without audiovisual stimulation because they are too repetitive when they think and imagine things on their own.', '大多数人害怕没有视听刺激，因为他们独自思考和想象时太过重复。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('Unrequited hate is vastly more diminishing for the self than unrequited love. You can''t react by reciprocating.', '单相恨比单相爱更削弱自我，因为你无法以相同的方式回应。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('For the compassionate, sorrow is more easily displaced by another sorrow than by joy.', '对于富有同情心的人来说，悲伤更容易被另一种悲伤取代，而不是被快乐取代。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('Wisdom in the young is as unattractive as frivolity in the elderly.', '年轻人的智慧与老年人的轻浮一样令人反感。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('Some people are only funny when they try to be serious.', '有些人只有在试图严肃时才显得好笑。', 23);
insert into public.sentences (text, text_zh, notebook_id) values ('It is difficult to stop the impulse to reveal secrets in conversation, as if information had the desire to live and the power to multiply.', '很难抑制在谈话中泄露秘密的冲动，仿佛信息本身有求生欲与繁殖力。', 23);