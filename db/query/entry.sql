-- name: CreateEntry :one
INSERT INTO ENTRIES (
  ACCOUNT_ID,
  AMOUNT
) VALUES (
  $1,
  $2
) RETURNING *;

-- name: GetEntry :one
SELECT
  *
FROM
  ENTRIES
WHERE
  ID = $1 LIMIT 1;

-- name: ListEntries :many
SELECT
  *
FROM
  ENTRIES
WHERE
  ACCOUNT_ID = $1
ORDER BY
  ID LIMIT $2 OFFSET $3;