SELECT DISTINCT author_id as id
FROM Views a
WHERE a.author_id IN (SELECT b.viewer_id FROM Views b WHERE a.article_id = b.article_id AND a.view_date = b.view_date)
ORDER BY author_id