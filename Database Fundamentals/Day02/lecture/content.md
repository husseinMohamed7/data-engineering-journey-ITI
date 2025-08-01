
# Database Concepts

## What is a Database?
A **database** is a collection of related data, and data is a collection of facts and figures that can be processed to produce information.

## What is a DBMS?
A **Database Management System (DBMS)** is the technology of storing and retrieving data with utmost efficiency along with appropriate security measures.

## DBMS Characteristics:
- ACID compliance
- Multi-user and concurrent access
- Multiple views
- Security

A typical DBMS has users with different rights and permissions who use it for different purposes.
Some users retrieve data, and others back it up.

---

# SQL Overview

**SQL (Structured Query Language)** is a database computer language designed for the retrieval and management of data in a relational database.

- It is used for storing, manipulating, and retrieving data.
- SQL is the standard language for Relational Database Systems.

## Examples of RDBMS:
- MySQL
- MS Access
- Oracle
- Sybase
- Informix
- PostgreSQL
- SQL Server

## SQL Variants:
- ANSI SQL
- T-SQL (used in Access, MS SQL Server, SQL Azure)
- PL/SQL (Oracle)
- IBM SQL
- MySQL (dialect)

## SQL Command Types:
- **DDL**: Data Definition Language
- **DML**: Data Manipulation Language

## SQL Query Processing Flow:
```text
SQL Query
   ↓
Query Language Processor (Parse and Optimize)
   ↓
DBMS Engine
   ↓
Physical Databases
```

---

# Database Fundamentals & DDL

## Lecture Topics:
- Databases fundamentals and characteristics
- DDL: Data Definition Language
  - CREATE, ALTER, DROP

---

## CREATE Database

```sql
CREATE DATABASE RentingCars;
```

---

## USE Database

```sql
USE RentingCars;
```

---

## CREATE TABLES

### Table: `Office`

```sql
CREATE TABLE Office (
    ID INT IDENTITY(10,10) PRIMARY KEY,
    OfficeName CHAR(3) CHECK(LEN(OfficeName) = 3),
    ContactNo CHAR(11) CHECK(LEN(ContactNo) = 11)
);
```

---

### Table: `CarOwner`

```sql
CREATE TABLE CarOwner (
    ID INT,
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NULL,
    City VARCHAR(5) NOT NULL DEFAULT 'Minia',

    CONSTRAINT PK_CarOwner_ID PRIMARY KEY (ID),
    CONSTRAINT chk_CarOwner_City CHECK (City IN ('Minia', 'Alex', 'Cairo'))
);
```

---

### Table: `Car`

```sql
CREATE TABLE Car (
    ID INT,
    OwnerID INT,
    Model CHAR(20),
    ModelYear INT,

    CONSTRAINT PK_Car_ID_OwnerID PRIMARY KEY (ID, OwnerID),
    CONSTRAINT unq_Car_ModelYear UNIQUE (ModelYear),
    CONSTRAINT FK_Car_CarOwner_OwnerID FOREIGN KEY (OwnerID)
        REFERENCES CarOwner(ID)
);
```

---

## Notes on Constraints

- **PK (Primary Key)**: One per table, Not Null + Unique.
- **FK (Foreign Key)**: Creates relation between tables.
- **UNIQUE**: Can be multiple per table. Allows only one `NULL` if `NULL` is allowed.
- **DEFAULT**: Provides a default value if none given.
- **CHECK**: Validates based on a condition.
- **NOT NULL / NULL**: Enforce presence or absence of value.
- **DATA TYPE (DT)**: Defines the type of each column (e.g., `int`, `varchar`, `nvarchar`, ...)

---

## Lecture Summary

- DDL:
  - CREATE
- Constraints:
  - Data Type
  - NULL / NOT NULL
  - Primary Key
  - Foreign Key
  - UNIQUE
  - DEFAULT
  - CHECK
