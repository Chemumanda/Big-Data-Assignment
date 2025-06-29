-- Top products by review volume and sentiment
SELECT 
    asin,
    COUNT(*) as review_count,
    AVG(overall) as avg_rating,
    SUM(CASE WHEN sentiment_label = 'positive' THEN 1 ELSE 0 END) as positive_reviews,
    SUM(CASE WHEN sentiment_label = 'negative' THEN 1 ELSE 0 END) as negative_reviews
FROM amazon_reviews_processed
GROUP BY asin
HAVING COUNT(*) >= 100
ORDER BY review_count DESC
LIMIT 20;
