Use financial_institution_marketing

SELECT 
    region,
    COUNT(*) AS total_campaigns,
    SUM(CASE WHEN response = 'Yes' THEN 1 ELSE 0 END) AS positive_responses,
    ROUND(100.0 * SUM(CASE WHEN response = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS response_rate
FROM campaigns
GROUP BY region
ORDER BY response_rate DESC;

SELECT 
    c.customer_id,
    COUNT(t.transaction_id) AS num_transactions,
    ROUND(AVG(t.amount), 2) AS avg_transaction_amount,
    ROUND(SUM(t.amount), 2) AS total_transaction_amount
FROM campaigns c
JOIN transactions t 
      ON c.customer_id = t.customer_id
WHERE c.response = 'Yes'
GROUP BY c.customer_id
ORDER BY total_transaction_amount DESC;

SELECT 
    channel,
    COUNT(*) AS total_campaigns,
    SUM(CASE WHEN response = 'Yes' THEN 1 ELSE 0 END) AS positive_responses,
    ROUND(100.0 * SUM(CASE WHEN response = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS response_rate
FROM campaigns
GROUP BY channel
ORDER BY response_rate DESC;

SELECT 
    income_level,
    COUNT(*) AS total_campaigns,
    SUM(CASE WHEN response = 'Yes' THEN 1 ELSE 0 END) AS positive_responses,
    ROUND(100.0 * SUM(CASE WHEN response = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS response_rate
FROM campaigns
GROUP BY income_level
ORDER BY response_rate DESC;

SELECT 
    occupation,
    COUNT(*) AS total_campaigns,
    SUM(CASE WHEN response = 'Yes' THEN 1 ELSE 0 END) AS positive_responses,
    ROUND(100.0 * SUM(CASE WHEN response = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS response_rate
FROM campaigns
GROUP BY occupation
ORDER BY response_rate DESC;
