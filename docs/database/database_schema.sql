-- enum type
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'category_type_enum') THEN
    CREATE TYPE category_type_enum AS ENUM ('income', 'expense');
  END IF;
END$$;

-- categories table
CREATE TABLE IF NOT EXISTS categories (
  category_id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(50) NOT NULL,
  category_type category_type_enum NOT NULL,
  icon VARCHAR(50) NOT NULL,
  is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
  user_id UUID NOT NULL
);

-- accounts table
CREATE TABLE IF NOT EXISTS accounts (
  account_id SERIAL PRIMARY KEY NOT NULL,
  user_id UUID NOT NULL,
  name VARCHAR(50) NOT NULL,
  currency VARCHAR(10) NOT NULL,
  icon VARCHAR(50) NOT NULL,
  is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMP NOT NULL DEFAULT now()
);

-- transactions table
CREATE TABLE IF NOT EXISTS transactions (
  transaction_id SERIAL PRIMARY KEY NOT NULL,
  account_id INT NOT NULL,
  category_id INT NOT NULL,
  amount NUMERIC(15,2) NOT NULL CHECK (amount > 0),
  note TEXT,
  transaction_date TIMESTAMP NOT NULL DEFAULT now()
);

-- Add foreign key constraints if they don't already exist
DO $$
BEGIN
  -- categories.user_id to auth.users(id)
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.table_constraints
    WHERE constraint_type = 'FOREIGN KEY'
      AND table_name = 'categories'
      AND constraint_name = 'categories_user_id_fkey'
  ) THEN
    ALTER TABLE categories
    ADD CONSTRAINT categories_user_id_fkey FOREIGN KEY (user_id)
    REFERENCES auth.users (id) ON DELETE CASCADE;
  END IF;

  -- accounts.user_id to auth.users(id)
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.table_constraints
    WHERE constraint_type = 'FOREIGN KEY'
      AND table_name = 'accounts'
      AND constraint_name = 'accounts_user_id_fkey'
  ) THEN
    ALTER TABLE accounts
    ADD CONSTRAINT accounts_user_id_fkey FOREIGN KEY (user_id)
    REFERENCES auth.users (id) ON DELETE CASCADE;
  END IF;

  -- transactions.account_id to accounts.account_id
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.table_constraints
    WHERE constraint_type = 'FOREIGN KEY'
      AND table_name = 'transactions'
      AND constraint_name = 'transactions_account_id_fkey'
  ) THEN
    ALTER TABLE transactions
    ADD CONSTRAINT transactions_account_id_fkey FOREIGN KEY (account_id)
    REFERENCES accounts (account_id) ON DELETE CASCADE;
  END IF;

  -- transactions.category_id to categories.category_id
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.table_constraints
    WHERE constraint_type = 'FOREIGN KEY'
      AND table_name = 'transactions'
      AND constraint_name = 'transactions_category_id_fkey'
  ) THEN
    ALTER TABLE transactions
    ADD CONSTRAINT transactions_category_id_fkey FOREIGN KEY (category_id)
    REFERENCES categories (category_id) ON DELETE CASCADE;
  END IF;
END$$;

