-- Connect to the database
\c postgres

BEGIN;
-- Insert mock data for todolists
INSERT INTO todolist (name) VALUES
  ('Work Tasks'),
  ('Personal Errands'),
  ('Home Improvement'),
  ('Learning Goals');

-- Insert mock data for todo items
INSERT INTO todo_item (todolist_id, task, done) VALUES
  (1, 'Finish project proposal', true),
  (1, 'Schedule team meeting', false),
  (1, 'Review marketing materials', false),
  (2, 'Buy groceries', false),
  (2, 'Pick up dry cleaning', true),
  (3, 'Paint living room', false),
  (3, 'Fix leaky faucet', true),
  (4, 'Complete online course', false),
  (4, 'Read chapter 5 of textbook', true);
COMMIT;