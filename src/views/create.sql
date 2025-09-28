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
