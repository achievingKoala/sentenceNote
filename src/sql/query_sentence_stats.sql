-- 查询单条句子的 likes 和 counts (userid = 1)
select
  s.*,
  COALESCE(sc.usage_count, 0) as usage_count,
  CASE
    WHEN sl.id IS NOT NULL THEN true
    ELSE false
  END as is_liked
from
  sentences s
  LEFT JOIN sentence_counts sc ON s.id = sc.sentence_id
  AND sc.user_id = 1
  LEFT JOIN sentence_likes sl ON s.id = sl.sentence_id
  AND sl.user_id = 1
WHERE
  s.id = 44;