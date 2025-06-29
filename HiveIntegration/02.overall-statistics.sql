-- Overall dataset statistics
SELECT 
    COUNT(*) as total_reviews,
    AVG(overall) as avg_rating,
    STDDEV(overall) as rating_stddev,
    AVG(review_length) as avg_review_length,
    MAX(review_length) as max_review_length
FROM amazon_reviews_processed;
