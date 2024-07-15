-- with min_ids as (
--     select min(id) as id, email from Person group by email
-- )
-- delete from Person p where p.id not in (select id from min_ids);

-- DELETE FROM person p1 USING Person p2
-- WHERE p1.email = p2.email
--   AND p1.id > p2.id;

DELETE FROM person
USING person p1
JOIN person p2
ON p1.email = p2.email AND p1.id > p2.id
WHERE person.id = p1.id;
