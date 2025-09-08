-- Phase 2 SQL Analysis

-- 1. Regions with Highest Response Rates
SELECT 
    region,
    COUNT(*) AS total_campaigns,
    SUM(CASE WHEN response = 'Yes' THEN 1 ELSE 0 END) AS positive_responses,
    ROUND(100.0 * SUM(CASE WHEN response = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS response_rate
FROM customer_campaign_summary
GROUP BY region
ORDER BY response_rate DESC;

-- 2. Transaction Activity Among Campaign Responders (Per Customer)
SELECT 
    customer_id,
    COUNT(DISTINCT transaction_id) AS num_transactions,
    ROUND(AVG(amount), 2) AS avg_transaction_amount,
    ROUND(SUM(amount), 2) AS total_transaction_amount
FROM customer_campaign_summary
WHERE response = 'Yes'
GROUP BY customer_id
ORDER BY total_transaction_amount DESC;

-- 2b. Transaction Activity Responders vs Non-Responders
SELECT 
    response,
    COUNT(DISTINCT transaction_id) AS total_transactions,
    ROUND(AVG(amount), 2) AS avg_amount,
    ROUND(SUM(amount), 2) AS total_amount
FROM customer_campaign_summary
GROUP BY response;

-- 3a. Campaign Effectiveness by Channel
SELECT 
    channel,
    COUNT(*) AS total_campaigns,
    SUM(CASE WHEN response = 'Yes' THEN 1 ELSE 0 END) AS positive_responses,
    ROUND(100.0 * SUM(CASE WHEN response = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS response_rate
FROM customer_campaign_summary
GROUP BY channel
ORDER BY response_rate DESC;

-- 3b. Campaign Effectiveness by Income Level
SELECT 
    income_level,
    COUNT(*) AS total_campaigns,
    SUM(CASE WHEN response = 'Yes' THEN 1 ELSE 0 END) AS positive_responses,
    ROUND(100.0 * SUM(CASE WHEN response = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS response_rate
FROM customer_campaign_summary
GROUP BY income_level
ORDER BY response_rate DESC;

-- 3c. Campaign Effectiveness by Occupation
SELECT 
    occupation,
    COUNT(*) AS total_campaigns,
    SUM(CASE WHEN response = 'Yes' THEN 1 ELSE 0 END) AS positive_responses,
    ROUND(100.0 * SUM(CASE WHEN response = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS response_rate
FROM customer_campaign_summary
GROUP BY occupation
ORDER BY response_rate DESC;
