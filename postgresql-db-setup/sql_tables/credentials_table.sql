-- credentials_table.sql
CREATE TABLE IF NOT EXISTS credentials (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,  -- UNIQUE RESTRICTION
    client_id TEXT NOT NULL,
    client_secret TEXT NOT NULL,
    access_token TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
