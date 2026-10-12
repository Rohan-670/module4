# Java + MySQL Student Management System

A desktop CRUD application with a Java Swing frontend and a real MySQL database accessed through JDBC.

## Features

- Create student records
- View and refresh records from MySQL
- Search by ID, name, email, phone, or course
- Update an existing record by selecting it in the table
- Delete a record after confirmation
- Validate required fields, email, and phone input
- Enforce unique email addresses in the database
- Use prepared statements and try-with-resources for database access
- Keep database credentials outside the source code using environment variables

## Requirements

- JDK 17 or later
- MySQL Server 8.0 or later
- Apache Maven 3.9 or later
- MySQL Workbench (optional, for running the SQL script visually)

## 1. Create the database table

1. Start the MySQL server.
2. Open MySQL Workbench and connect to your local server.
3. Open `schema.sql` and execute the complete script. It creates the `student_management` database and the `students` table.

Alternatively, from a terminal:

```bash
mysql -u root -p < schema.sql
```

Enter your MySQL password when prompted.

## 2. Configure the connection

The app reads these environment variables:

- `DB_URL` (optional; defaults to the local database URL in `Database.java`)
- `DB_USER` (defaults to `root`)
- `DB_PASSWORD` (defaults to an empty password)

Set `DB_PASSWORD` to your own local MySQL password before running the app. Do not commit real credentials to source control.

### Windows Command Prompt

```bat
set DB_USER=root
set DB_PASSWORD=your_mysql_password
set DB_URL=jdbc:mysql://localhost:3306/student_management?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC
```

Run the Maven command below in the same Command Prompt window.

### Windows PowerShell

```powershell
$env:DB_USER = "root"
$env:DB_PASSWORD = "your_mysql_password"
$env:DB_URL = "jdbc:mysql://localhost:3306/student_management?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"
```

### macOS / Linux

```bash
export DB_USER=root
export DB_PASSWORD='your_mysql_password'
export DB_URL='jdbc:mysql://localhost:3306/student_management?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC'
```

Use the username and password configured on your own MySQL server. If your server uses a non-default port or host, edit `DB_URL`.

## 3. Run the app

Open a terminal in the project root (the folder that contains `pom.xml`) and run:

```bash
mvn clean compile exec:java
```

Maven downloads the MySQL JDBC driver specified in `pom.xml`, compiles the Java code, and launches the desktop window. An internet connection is needed the first time so Maven can download dependencies.

## 4. Use the application

1. Enter Full name, Email, and Course. Phone is optional.
2. Select **Add** to save a row in MySQL.
3. Select a row in the table to load its data into the form.
4. Select **Update** to edit that row, or **Delete** to remove it after confirmation.
5. Use Search to filter by ID, name, email, phone, or course. Select **Show all** to clear the filter.

The table is backed by the MySQL `students` table. Closing and reopening the app does not remove records.

## Database table

`students` contains:

| Column | Purpose |
| --- | --- |
| `id` | Auto-increment primary key |
| `full_name` | Student name (required) |
| `email` | Required and unique email |
| `phone` | Optional contact number |
| `course` | Course or branch (required) |
| `created_at` | Automatically recorded creation timestamp |
| `updated_at` | Automatically updated modification timestamp |

## Troubleshooting

- **Communications link failure / connection refused:** Start MySQL Server and verify the host and port in `DB_URL`.
- **Access denied for user:** Set the correct `DB_USER` and `DB_PASSWORD` for your MySQL account.
- **Unknown database:** Run `schema.sql` before launching the app.
- **Duplicate entry for email:** Each student must use a unique email address; choose another email or edit the existing record.
- **Maven command not found:** Install Maven and ensure `mvn` is on your PATH.
- **Maven cannot download dependencies:** Check internet access and try again.

## Notes

This is an educational starter project, not a production school information system. A production deployment should use a least-privilege database account, encrypted database connections, stronger access control, backups, and server-side audit logging.
