


-- table1 for user registration and login
CREATE TABLE USERS
(
   userId INT  PRIMARY KEY IDENTITY(100,1),    --Primary Key
   name NVARCHAR(100) NOT NULL,
   email NVARCHAR(100) UNIQUE NOT NULL,
   password NVARCHAR(12) NOT NULL
);
-- table2 for transactions  one-user can have many-transactions
CREATE TABLE TRANSACTIONS
(
   transactionId INT PRIMARY KEY IDENTITY(100,1),   --Primary Key
   userId INT FOREIGN KEY REFERENCES Users(UserID) NOT NULL,   --Foreign key
   amount DECIMAL(10,2) NOT NULL,
   transactionType NVARCHAR(20) CHECK (transactionType IN ('Income','Expense')),
   note NVARCHAR(255),
   Date DATETIME DEFAULT GETDATE()  
);
--table3 for budgets and expense limit  one-user can have many-budgets
CREATE TABLE BUDGETS
(
   budgetId INT PRIMARY KEY IDENTITY(100,1),    --Primary Key
   userId INT FOREIGN KEY REFERENCES Users(UserID) NOT NULL,  --Foreign key
   month INT CHECK (Month BETWEEN 1 AND 12),
   year INT,
   Amount DECIMAL(10,2) NOT NULL
);