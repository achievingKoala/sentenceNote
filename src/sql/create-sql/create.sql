create table public.sentences (
  id serial not null,
  text text not null,
  text_zh text null,
  notebook_id integer null,
  constraint sentences_pkey primary key (id),
  constraint sentences_text_key unique (text)
) TABLESPACE pg_default;

-- 计数表：一行对应一条句子
CREATE TABLE public.sentence_counts (
  id          bigserial PRIMARY KEY,
  sentence_id  integer PRIMARY KEY
    REFERENCES public.sentences(id) ON DELETE CASCADE,
  usage_count  integer  NOT NULL DEFAULT 0,
  user_id     integer not null default 1                 -- 未来会引用 users(id)
);
--   updated_at   timestamptz NOT NULL DEFAULT now()  -- 最近一次更新


-- 收藏表：单用户阶段用 user_id IS NULL；未来引入 user_id 后照用
CREATE TABLE public.sentence_likes (
  id          bigserial PRIMARY KEY,
  sentence_id integer NOT NULL
    REFERENCES public.sentences(id) ON DELETE CASCADE,
  user_id     integer not null default 1                 -- 未来会引用 users(id)
);