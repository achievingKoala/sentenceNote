-- +1 计数
INSERT INTO public.sentence_counts(user_id, sentence_id, usage_count)
VALUES (1, 33, 1)
ON CONFLICT (sentence_id) DO UPDATE
SET usage_count = public.sentence_counts.usage_count + 1;