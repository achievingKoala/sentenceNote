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
insert into public.sentences (text, notebook_id) values ('An idea starts to be interesting when you get scared of taking it to its logical conclusion.', 22);
insert into public.sentences (text, notebook_id) values ('Pharmaceutical companies are better at inventing diseases that match existing drugs, rather than inventing drugs to match existing diseases.', 22);
insert into public.sentences (text, notebook_id) values ('To understand the liberating effect of asceticism, consider that losing all your fortune is much less painful than losing only half of it.', 22);
insert into public.sentences (text, notebook_id) values ('To bankrupt a fool, give him information.', 22);
insert into public.sentences (text, notebook_id) values ('Academia is to knowledge what prostitution is to love; close enough on the surface but, to the nonsucker, not exactly the same thing.', 22);
insert into public.sentences (text, notebook_id) values ('In science you need to understand the world; in business you need others to misunderstand it.', 22);
insert into public.sentences (text, notebook_id) values ('I suspect that they put Socrates to death because there is something terribly unattractive, alienating, and nonhuman in thinking with too much clarity.', 22);
insert into public.sentences (text, notebook_id) values ('Education makes the wise slightly wiser, but it makes the fool vastly more dangerous.', 22);
insert into public.sentences (text, notebook_id) values ('The test of originality for an idea is not the absence of one single predecessor but the presence of multiple but incompatible ones.', 22);
insert into public.sentences (text, notebook_id) values ('Modernity''s double punishment is to make us both age prematurely and live longer.', 22);
insert into public.sentences (text, notebook_id) values ('An erudite is someone who displays less than he knows; a journalist or consultant, the opposite.', 22);
insert into public.sentences (text, notebook_id) values ('Your brain is most intelligent when you don''t instruct it on what to do—something people who take showers discover on occasion.', 22);
insert into public.sentences (text, notebook_id) values ('If your anger decreases with time, you did injustice; if it increases, you suffered injustice.', 22);
insert into public.sentences (text, notebook_id) values ('I wonder if those who advocate generosity for its rewards notice the inconsistency, or if what they call generosity is an attractive investment strategy.', 22);
insert into public.sentences (text, notebook_id) values ('Those who think religion is about "belief" don''t understand religion, and don''t understand belief.', 22);
insert into public.sentences (text, notebook_id) values ('Work destroys your soul by stealthily invading your brain during the hours not officially spent working; be selective about professions.', 22);
insert into public.sentences (text, notebook_id) values ('In nature we never repeat the same motion; in captivity (office, gym, commute, sports), life is just repetitive stress injury. No randomness.', 22);
insert into public.sentences (text, notebook_id) values ('Using, as an excuse, others'' failure of common sense is in itself a failure of common sense.', 22);
insert into public.sentences (text, notebook_id) values ('Compliance with the straitjacket of narrow (Aristotelian) logic and avoidance of fatal inconsistencies are not the same thing.', 22);
insert into public.sentences (text, notebook_id) values ('Economics cannot digest the idea that the collective (and the aggregate) are disproportionately less predictable than individuals.', 22);
insert into public.sentences (text, notebook_id) values ('Don''t talk about "progress" in terms of longevity, safety, or comfort before comparing zoo animals to those in the wilderness.', 22);
insert into public.sentences (text, notebook_id) values ('If you know, in the morning, what your day looks like with any precision, you are a little bit dead—the more precision, the more dead you are.', 22);
insert into public.sentences (text, notebook_id) values ('There is no intermediate state between ice and water but there is one between life and death: employment.', 22);
insert into public.sentences (text, notebook_id) values ('You have a calibrated life when most of what you fear has the titillating prospect of adventure.', 22);
insert into public.sentences (text, notebook_id) values ('Procrastination is the soul rebelling against entrapment.', 22);
insert into public.sentences (text, notebook_id) values ('Nobody wants to be perfectly transparent; not to others, certainly not to himself.', 22);
