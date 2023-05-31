-- name: CreateUser :one
INSERT INTO USERS(
    USERNAME,
    HASHED_PASSWORD,
    FULL_NAME,
    EMAIL
) VALUES (
    $1,
    $2,
    $3,
    $4
) RETURNING *;

-- name: GetUser :one
SELECT
    *
FROM
    USERS
WHERE
    USERNAME=$1 LIMIT 1;