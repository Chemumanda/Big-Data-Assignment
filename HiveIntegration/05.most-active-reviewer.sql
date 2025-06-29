-- Most active reviewers
SELECT 
    reviewerID,
    COUNT(*) as review_count,
    ROUND(AVG(overall), 2) as avg_rating_given,
    STDDEV(overall) as rating_consistency,
    COUNT(DISTINCT asin) as unique_products_reviewed,
    MIN(FROM_UNIXTIME(unixReviewTime)) as first_review_date,
    MAX(FROM_UNIXTIME(unixReviewTime)) as last_review_date,
    DATEDIFF(MAX(FROM_UNIXTIME(unixReviewTime)), MIN(FROM_UNIXTIME(unixReviewTime))) as review_span_days
FROM reviews_raw
WHERE reviewerID IS NOT NULL AND overall IS NOT NULL AND unixReviewTime IS NOT NULL
GROUP BY reviewerID
HAVING COUNT(*) >= 20  -- Reviewers with at least 20 reviews
ORDER BY review_count DESC
LIMIT 20;

