-- name: CreateTransfer :one
INSERT INTO TRANSFERS (
  FROM_ACCOUNT_ID,
  TO_ACCOUNT_ID,
  AMOUNT
) VALUES (
  $1,
  $2,
  $3
) RETURNING *;

-- name: GetTransfer :one
SELECT
  *
FROM
  TRANSFERS
WHERE
  ID = $1 LIMIT 1;

-- name: ListTransfers :many
SELECT
  *
FROM
  TRANSFERS
WHERE
  FROM_ACCOUNT_ID = $1
  OR TO_ACCOUNT_ID = $2
ORDER BY
  ID LIMIT $3 OFFSET $4;