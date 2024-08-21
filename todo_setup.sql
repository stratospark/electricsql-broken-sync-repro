-- Connect to the database
\c postgres

-- Create the todolist table
CREATE TABLE IF NOT EXISTS todolist (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create the todo_item table
CREATE TABLE IF NOT EXISTS todo_item (
  id SERIAL PRIMARY KEY,
  todolist_id INTEGER REFERENCES todolist(id) ON DELETE CASCADE,
  task TEXT NOT NULL,
  done BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);