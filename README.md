# Bug Reproduction Guide

This guide will walk you through the steps to reproduce a specific bug in our todo list application. You'll set up the database twice: once with working data and once with data that triggers the bug.

## Prerequisites

- Docker and Docker Compose installed
- psql (PostgreSQL command-line tool) installed
- Access to the project's Docker Compose configuration
- Google Chrome browser

## Steps to Reproduce

### 1. Start the Application

```bash
docker-compose up --build
```

Wait for all services to start up completely.

### 2. Reproduce the Working Scenario

1. Drop any existing tables:

   ```bash
   psql postgres://postgres:password@localhost:5432/postgres -f drop_all_tables.sql
   ```

2. Set up the tables:

   ```bash
   psql postgres://postgres:password@localhost:5432/postgres -f todo_setup.sql
   ```

3. Open Google Chrome and navigate to:

   ```
   http://localhost
   ```

4. Open the Chrome Developer Tools (F12 or Right-click > Inspect).
      ![image](https://github.com/user-attachments/assets/d6a4300f-ec82-4072-8a9d-41cdf510b3e9)
5. Switch to the Console tab in the Developer Tools.

6. Add working data:

   ```bash
   psql postgres://postgres:password@localhost:5432/postgres -f todo_add_additional_data_works.sql
   ```

7. Refresh the application in Chrome (F5 or Ctrl+R / Cmd+R).
8. Check the console in Chrome Developer Tools. You should not see any bug-related errors at this point.

### 3. Reproduce the Bug

1. Reset the environment, run `docker-compose down -v` before starting again with `docker-compose up --build`.

2. Set up the tables:

   ```bash
   psql postgres://postgres:password@localhost:5432/postgres -f todo_setup.sql
   ```

3. Refresh the application in Chrome.

4. Add the data that triggers the bug:

   ```bash
   psql postgres://postgres:password@localhost:5432/postgres -f todo_add_additional_data_broken.sql
   ```

5. Check the console in Chrome Developer Tools. You should now see the bug-related errors.
   ![image](https://github.com/user-attachments/assets/d0effe51-5af1-4bd5-b545-524bc83473ea)


## Expected vs Actual Behavior

- Expected: No errors in the Chrome console after adding data and refreshing the page.
- Actual: Errors appear in the Chrome console after adding the "broken" data and refreshing the page.

## Additional Notes

- If you need to reset the environment, run `docker-compose down -v` before starting again with `docker-compose up --build`.
- Make sure you're using the correct database connection string in all commands: `postgres://postgres:password@localhost:5432/postgres`
- Always refresh the Chrome tab after running todo_setup and after adding data to see the changes reflected in the application.

If you encounter any issues following these steps or if the bug doesn't reproduce as expected, please contact the development team.
