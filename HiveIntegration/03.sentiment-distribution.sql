-- Sentiment distribution by category
SELECT 
    category,
    sentiment_label,
    COUNT(*) as review_count,
    AVG(overall) as avg_rating,
    AVG(helpful_ratio) as avg_helpful_ratio
FROM amazon_reviews_processed
GROUP BY category, sentiment_label
ORDER BY category, sentiment_label;

