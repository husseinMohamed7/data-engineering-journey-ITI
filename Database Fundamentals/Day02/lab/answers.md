<h1 align="center">Day 01 – Databases</h1>
<h3 align="center">ITI Minya – Round 1</h3>
<h3 align="center">Name: Hussein Mohamed</h3>

---

## 🔸 Q2: Create the following tables with all the required information and insert the required data as specified in each table using `INSERT` statements (at least two rows):

### a. Table Name: **Department** (Programmatically)

#### i. Columns:
1. **DeptNo**: `INT`, Primary Key.  
2. **DeptName**: `NVARCHAR(20)`  
   - **Why did we choose `NVARCHAR` data type and not `NCHAR` or `VARCHAR`?**  
3. **Location**: `NCHAR(2)`  
   - **Why did we choose `NCHAR` data type and not `NVARCHAR`?**  
   - **Can we make the data type for that column as `CHAR(2)`?**  

#### ii. Additional Requirements:
- Table values of **Location** should be one of the following only: `NY`, `DS`, `KW`.  
- Do what’s required to ensure the user **cannot enter any other values**.

#### iii. Default Value:
- Make the **Location** column value **"NY"** as the default if the user doesn’t insert it.

```sql
CREATE TABLE Department
(
    DeptNo INT,
    DeptName NVARCHAR(20),
    -- nvarchar not nchar because the size of the columns may vary
    Location NCHAR(2) DEFAULT 'NY',
    -- it's known size so we used nchar not nvarchar
    -- yes we can make it char if it's in English

    CONSTRAINT DeptNo_Department_PK PRIMARY KEY (DeptNo),
    CONSTRAINT location_Department_chk CHECK (Location IN ('NY','DS','KW'))
);
```
### b. Create the following tables, and use Suitable data types and constraints:


