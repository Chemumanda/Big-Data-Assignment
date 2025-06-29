-- Review trends over time
SELECT 
    YEAR(review_date) as review_year,
    MONTH(review_date) as review_month,
    category,
    COUNT(*) as monthly_reviews,
    AVG(overall) as avg_monthly_rating
FROM amazon_reviews_processed
WHERE review_date >= '2020-01-01'
GROUP BY YEAR(review_date), MONTH(review_date), category
ORDER BY review_year, review_month, category;

-- Seasonal sentiment patterns
SELECT 
    CASE 
        WHEN MONTH(review_date) IN (12, 1, 2) THEN 'Winter'
        WHEN MONTH(review_date) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(review_date) IN (6, 7, 8) THEN 'Summer'
        ELSE 'Fall'
    END as season,
    sentiment_label,
    COUNT(*) as review_count,
    AVG(overall) as avg_rating
FROM amazon_reviews_processed
GROUP BY 
    CASE 
        WHEN MONTH(review_date) IN (12, 1, 2) THEN 'Winter'
        WHEN MONTH(review_date) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(review_date) IN (6, 7, 8) THEN 'Summer'
        ELSE 'Fall'
    END,
    sentiment_label
ORDER BY season, sentiment_label;

