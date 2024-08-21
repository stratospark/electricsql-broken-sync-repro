-- Connect to the database
\c postgres

-- Disable foreign key checks to avoid dependency issues while dropping tables
SET session_replication_role = 'replica';

-- Drop tables if they exist
DROP TABLE IF EXISTS todo_item;
DROP TABLE IF EXISTS todolist;
DROP TABLE IF EXISTS todo;

-- Re-enable foreign key checks
SET session_replication_role = 'origin';

-- Verify that tables have been dropped
\dt

-- Display a message
SELECT 'All specified tables have been dropped.' AS result;