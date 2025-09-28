create table public.sentences (
  id serial not null,
  text text not null,
  count integer not null default 0,
  text_zh text null,
  notebook_id integer null,
  is_favorite boolean not null default false,
  constraint sentences_pkey primary key (id)
) TABLESPACE pg_default;

insert into public.sentences (text, notebook_id) values ('The person you are the most afraid to contradict is yourself.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('The person you are the most afraid to contradict is yourself.', '你最害怕反驳的人就是你自己。', 22);
insert into public.sentences (text, notebook_id) values ('An idea starts to be interesting when you get scared of taking it to its logical conclusion.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('An idea starts to be interesting when you get scared of taking it to its logical conclusion.', '当一个想法让你害怕把它推向逻辑的极限时，它才开始变得有趣。', 22);
insert into public.sentences (text, notebook_id) values ('Pharmaceutical companies are better at inventing diseases that match existing drugs, rather than inventing drugs to match existing diseases.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Pharmaceutical companies are better at inventing diseases that match existing drugs, rather than inventing drugs to match existing diseases.', '制药公司更擅长发明与现有药物匹配的疾病，而不是发明治疗现有疾病的药物。', 22);
insert into public.sentences (text, notebook_id) values ('To understand the liberating effect of asceticism, consider that losing all your fortune is much less painful than losing only half of it.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('To understand the liberating effect of asceticism, consider that losing all your fortune is much less painful than losing only half of it.', '要理解禁欲主义的解放效应，想想失去全部财富远比只失去一半痛苦得少。', 22);
insert into public.sentences (text, notebook_id) values ('To bankrupt a fool, give him information.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('To bankrupt a fool, give him information.', '想让一个傻瓜破产，就给他信息。', 22);
insert into public.sentences (text, notebook_id) values ('Academia is to knowledge what prostitution is to love; close enough on the surface but, to the nonsucker, not exactly the same thing.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Academia is to knowledge what prostitution is to love; close enough on the surface but, to the nonsucker, not exactly the same thing.', '学术之于知识，如同卖淫之于爱情；表面看似接近，但对不被骗的人来说完全不同。', 22);
insert into public.sentences (text, notebook_id) values ('In science you need to understand the world; in business you need others to misunderstand it.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('In science you need to understand the world; in business you need others to misunderstand it.', '在科学中你需要理解世界；在商业中你需要让别人误解世界。', 22);
insert into public.sentences (text, notebook_id) values ('I suspect that they put Socrates to death because there is something terribly unattractive, alienating, and nonhuman in thinking with too much clarity.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('I suspect that they put Socrates to death because there is something terribly unattractive, alienating, and nonhuman in thinking with too much clarity.', '我怀疑他们处死苏格拉底，是因为过于清晰的思考有某种令人厌恶、疏离且不人性的特质。', 22);
insert into public.sentences (text, notebook_id) values ('Education makes the wise slightly wiser, but it makes the fool vastly more dangerous.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Education makes the wise slightly wiser, but it makes the fool vastly more dangerous.', '教育让智者稍微更聪明，却让愚者更加危险。', 22);
insert into public.sentences (text, notebook_id) values ('The test of originality for an idea is not the absence of one single predecessor but the presence of multiple but incompatible ones.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('The test of originality for an idea is not the absence of one single predecessor but the presence of multiple but incompatible ones.', '检验一个想法是否原创，不在于是否无前例，而在于是否存在多个相互不兼容的前例。', 22);
insert into public.sentences (text, notebook_id) values ('Modernity''s double punishment is to make us both age prematurely and live longer.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Modernity''s double punishment is to make us both age prematurely and live longer.', '现代性的双重惩罚是让我们早衰却又活得更久。', 22);
insert into public.sentences (text, notebook_id) values ('An erudite is someone who displays less than he knows; a journalist or consultant, the opposite.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('An erudite is someone who displays less than he knows; a journalist or consultant, the opposite.', '博学者展示的永远少于他所知道的；记者或顾问则相反。', 22);
insert into public.sentences (text, notebook_id) values ('Your brain is most intelligent when you don''t instruct it on what to do—something people who take showers discover on occasion.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Your brain is most intelligent when you don''t instruct it on what to do—something people who take showers discover on occasion.', '当你不命令大脑去做什么时，它最聪明——洗澡时的人偶尔会发现这一点。', 22);
insert into public.sentences (text, notebook_id) values ('If your anger decreases with time, you did injustice; if it increases, you suffered injustice.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('If your anger decreases with time, you did injustice; if it increases, you suffered injustice.', '如果你的愤怒随着时间减少，是你做了不公；如果增加，则是你遭受了不公。', 22);
insert into public.sentences (text, notebook_id) values ('I wonder if those who advocate generosity for its rewards notice the inconsistency, or if what they call generosity is an attractive investment strategy.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('I wonder if those who advocate generosity for its rewards notice the inconsistency, or if what they call generosity is an attractive investment strategy.', '我想知道那些为了回报而提倡慷慨的人是否察觉到这种矛盾，或者他们所谓的慷慨其实是一种诱人的投资策略。', 22);
insert into public.sentences (text, notebook_id) values ('Those who think religion is about "belief" don''t understand religion, and don''t understand belief.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Those who think religion is about "belief" don''t understand religion, and don''t understand belief.', '那些认为宗教是“信仰”的人既不了解宗教，也不了解信仰。', 22);
insert into public.sentences (text, notebook_id) values ('Work destroys your soul by stealthily invading your brain during the hours not officially spent working; be selective about professions.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Work destroys your soul by stealthily invading your brain during the hours not officially spent working; be selective about professions.', '工作在你非工作时间偷偷侵入你的大脑，从而摧毁你的灵魂；选择职业时要慎重。', 22);
insert into public.sentences (text, notebook_id) values ('In nature we never repeat the same motion; in captivity (office, gym, commute, sports), life is just repetitive stress injury. No randomness.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('In nature we never repeat the same motion; in captivity (office, gym, commute, sports), life is just repetitive stress injury. No randomness.', '在自然界中我们从不重复相同的动作；而在囚禁中（办公室、健身房、通勤、运动），生活只是一种重复性劳损。没有随机性。', 22);
insert into public.sentences (text, notebook_id) values ('Using, as an excuse, others'' failure of common sense is in itself a failure of common sense.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Using, as an excuse, others'' failure of common sense is in itself a failure of common sense.', '以他人缺乏常识为借口，本身就是一种常识的缺乏。', 22);
insert into public.sentences (text, notebook_id) values ('Compliance with the straitjacket of narrow (Aristotelian) logic and avoidance of fatal inconsistencies are not the same thing.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Compliance with the straitjacket of narrow (Aristotelian) logic and avoidance of fatal inconsistencies are not the same thing.', '遵守狭隘的（亚里士多德式）逻辑约束与避免致命矛盾并不是一回事。', 22);
insert into public.sentences (text, notebook_id) values ('Economics cannot digest the idea that the collective (and the aggregate) are disproportionately less predictable than individuals.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Economics cannot digest the idea that the collective (and the aggregate) are disproportionately less predictable than individuals.', '经济学无法消化这样一个观念：集体（或总体）的可预测性远低于个体。', 22);
insert into public.sentences (text, notebook_id) values ('Don''t talk about "progress" in terms of longevity, safety, or comfort before comparing zoo animals to those in the wilderness.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Don''t talk about "progress" in terms of longevity, safety, or comfort before comparing zoo animals to those in the wilderness.', '在把动物园的动物与野外的动物作比较之前，不要谈论“进步”的长寿、安全或舒适。', 22);
insert into public.sentences (text, notebook_id) values ('If you know, in the morning, what your day looks like with any precision, you are a little bit dead—the more precision, the more dead you are.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('If you know, in the morning, what your day looks like with any precision, you are a little bit dead—the more precision, the more dead you are.', '如果你早晨就能精确预测自己的一天，那你就已经有点死了——越精确，越死。', 22);
insert into public.sentences (text, notebook_id) values ('There is no intermediate state between ice and water but there is one between life and death: employment.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('There is no intermediate state between ice and water but there is one between life and death: employment.', '冰与水之间没有中间状态，但生与死之间有一个：就业。', 22);
insert into public.sentences (text, notebook_id) values ('You have a calibrated life when most of what you fear has the titillating prospect of adventure.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('You have a calibrated life when most of what you fear has the titillating prospect of adventure.', '当你恐惧的多数事物都带有刺激的冒险前景时，你的生活才算被校准。', 22);
insert into public.sentences (text, notebook_id) values ('Procrastination is the soul rebelling against entrapment.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Procrastination is the soul rebelling against entrapment.', '拖延是灵魂对束缚的反抗。', 22);
insert into public.sentences (text, notebook_id) values ('Nobody wants to be perfectly transparent; not to others, certainly not to himself.', 22);
insert into public.sentences (text, text_zh, notebook_id) values ('Nobody wants to be perfectly transparent; not to others, certainly not to himself.', '没有人希望完全透明；既不想对别人，也不想对自己。', 22);
