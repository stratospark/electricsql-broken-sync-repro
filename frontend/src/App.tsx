import { useEffect, useState } from "react";
import "./App.css";
import { PGlite } from "@electric-sql/pglite";
import { electricSync } from "@electric-sql/pglite-sync";

function App() {
  useEffect(() => {
    async function inner() {
      const pg = await PGlite.create({
        extensions: {
          electric: electricSync({}),
        },
      });

      await pg.exec(`
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
  `);
      const shapeTodolist = await pg.electric.syncShapeToTable({
        url: "http://localhost/electric/v1/shape/todolist",
        table: "todolist",
        primaryKey: ["id"],
      });
      const shapeTodoitem = await pg.electric.syncShapeToTable({
        url: "http://localhost/electric/v1/shape/todo_item",
        table: "todo_item",
        primaryKey: ["id"],
      });
    }
    inner();
  }, []);

  return <div></div>;
}

export default App;
