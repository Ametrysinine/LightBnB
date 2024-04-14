SELECT
  reservations.id,
  properties.title AS title,
  reservations.start_date AS start_date,
  cost_per_night,
  AVG(property_reviews.rating) AS average_rating
FROM
  reservations
  JOIN properties ON reservations.property_id = properties.id
  JOIN property_reviews ON property_reviews.property_id = properties.id
  JOIN users ON reservations.guest_id = users.id
WHERE
  users.id = 1
GROUP BY
  reservations.id,
  properties.title,
  properties.cost_per_night
ORDER BY
  start_date ASC
LIMIT
  10;