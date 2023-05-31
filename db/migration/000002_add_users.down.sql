ALTER TABLE IF EXISTS "accounts" DROP CONSTANT IF EXISTS "owner_currency_key";

ALTER TABLE IF EXISTS "accounts" DROP CONSTANT IF EXISTS "accounts _owner_fkey";

DROP TABLE IF EXISTS "users";