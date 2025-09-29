ALTER TABLE public.sentence_counts 
ADD CONSTRAINT sentence_counts_user_sentence_unique 
UNIQUE (user_id, sentence_id);