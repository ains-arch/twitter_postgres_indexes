-- Index for efficient searches on tag and id_tweets in tweet_tags table
CREATE INDEX tweet_tags_tag_id_tweets_idx ON tweet_tags USING btree (tag text_pattern_ops, id_tweets);

-- Index for covering queries that use id_tweets and tag together in tweet_tags table
CREATE INDEX tweet_tags_id_tweets_tag_idx ON tweet_tags USING btree (id_tweets, tag);

-- Index for optimizing queries that filter by id_tweets and lang in tweets table
CREATE INDEX tweets_id_tweets_lang_idx ON tweets USING btree (id_tweets, lang);

-- GIN index for full-text search using tsvector of text column in tweets table
CREATE INDEX tweets_to_tsvector_idx ON tweets USING gin(to_tsvector('english', text));
