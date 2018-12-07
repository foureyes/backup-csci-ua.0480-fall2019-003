INSERT INTO customer_rating
SELECT name, score 
FROM customer
LEFT JOIN rating
ON customer.cid = rating.cid;


SELECT landlord.name, lr_counts.residence_count
FROM landlord
INNER JOIN
	(SELECT residence.lid, count(*) as residence_count
	FROM residence 
	GROUP BY residence.lid
	HAVING count(*) > 1) as lr_counts
ON lr_counts.lid = landlord.lid;

