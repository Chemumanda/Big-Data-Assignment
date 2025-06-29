-- Create external table for raw reviews
CREATE TABLE IF NOT EXISTS amazon_reviews_raw (
    reviewerID string,
    asin string,
    reviewerName string,
    helpful array<int>,
    reviewText string,
    overall double,
    summary string,
    unixReviewTime bigint,
    reviewTime string
)
STORED AS TEXTFILE
LOCATION '/user/data/amazon_reviews/'
TBLPROPERTIES ('has_encrypted_data'='false');


-- Create external Hive table for processed reviews
CREATE EXTERNAL TABLE amazon_reviews_processed (
    reviewerID STRING,
    asin STRING,
    reviewText STRING,
    overall DOUBLE,
    summary STRING,
    review_date TIMESTAMP,
    review_length INT,
    helpful_ratio DOUBLE,
    review_word_count INT,
    avg_word_length DOUBLE
)
PARTITIONED BY (
    category STRING,
    sentiment_label STRING
)
STORED AS PARQUET
LOCATION 'hdfs://namenode:9000/processed_reviews/'
TBLPROPERTIES ('parquet.compress'='SNAPPY');

-- Repair partitions
MSCK REPAIR TABLE amazon_reviews_processed;