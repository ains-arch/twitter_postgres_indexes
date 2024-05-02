/*
 * Count the number of English tweets containing the word "coronavirus"
 * gin multicolumn thing isn't necessary but might be on the final
 */
SELECT
    count(*)
FROM tweets
WHERE to_tsvector('english',text)@@to_tsquery('english','coronavirus')
  AND lang='en'
;
