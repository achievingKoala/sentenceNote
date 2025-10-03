create table public.sentences (
  id serial not null,
  text text not null,
  text_zh text null,
  notebook_id integer null,
  constraint sentences_pkey primary key (id),
  constraint sentences_text_key unique (text)
) TABLESPACE pg_default;