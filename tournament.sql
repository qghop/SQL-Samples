CREATE TABLE IF NOT EXISTS user (
    userID int NOT NULL UNIQUE PRIMARY KEY,
    name varchar(50) NOT NULL,
    location text,
    gender varchar(75) UNIQUE NOT NULL,
    email text,
    age int
);

