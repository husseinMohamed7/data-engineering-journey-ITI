<h1 align="center">Day 01 – Database Fundamentals</h1>

---

## 🔸 ERD & Mapping the Four Scenarios:

---

### **1. Intermediary Car Rental Company**

**Requirements:**
- When a tenant rents a car, store the transaction details: **start date**, **duration**, and **payment method**.
- The company has multiple **offices** with: **ID**, **address**, and **contact number**.
- **Owners** who rent out cars must provide: **full name**, **national ID**, **bank account number**.
- An owner applies through **only one office**.
- An owner can rent **one or more cars**, but each car must belong to one owner.
- **Car details:** ID, model (brand, name, year), license image, rent value, status (Booked, In Maintenance, Available).
- **Tenant details:** national ID, valid driving license, mobile number.
- Each **rental transaction** includes: start date, duration, payment method.

**ERD Diagram:**
![Car Rental ERD](imgs/001.png)

---

### **2. XX Medical Analysis Laboratory**

**Scenario:**
Design a system to manage **branches**, **medical tests**, **patients**, and **employees**.

**Requirements:**
- Each branch has: code, short name, address (city, area, street, building, floor).
- Branch provides **medical tests**:
  - Each test: code, name, cost, conditions (if any), duration.
- Patients visit branches for tests:
  - Patient info: ID, name, age, mobile, DOB, gender, chronic diseases.
- Track visits: which patient → which branch → which tests, with date and time.
- Employees:
  - Each works in one branch.
  - Employee info: ID, name, salary, team (e.g., chemists, doctors), working hours.
  - Supervisor (if any).
- Each branch has **one manager only**.

**ERD Diagram:**
![Medical Lab ERD](imgs/002.png)

---

### **3. XYZ Take-Away Restaurants**

**Scenario:**
XYZ needs a database for **branches**, **staff**, **customers**, **menu items**, and **orders**.

**Requirements:**
- Each branch has staff:
  - Each staff member: ID, name, age, address (city, region), role, joining date, salary.
  - One staff is branch manager.
- Customers: code, name, contact number.
- Menu items:
  - Some shared between branches.
  - Info: code, name, price, category.
- Orders:
  - Each order: ID, delivery address, total bill, date/time, items.
  - One or more items per order.
- Delivery boys: name, contact number.

**ERD Diagram:**
![XYZ Restaurant ERD](imgs/003.png)

---

### **4. International School Database System**

**Scenario:**
System to manage **students**, **applications**, **medical reports**, **siblings**, **parents**, **teachers**, and **classes**.

**Requirements:**
- Each student has one application with unique serial number and division (e.g., American, British).
- Medical report: weight, height, diseases, allergies.
- Student data: serial no, name, age, gender, DOB, last certificate, school email.
- Sibling info for discount percentage.
- Parents: ID, name, relationship.
- Teachers: ID, name, subject, phone, email, salary.
- Each subject has a senior teacher (subject head).
- Classes: name, location (building, floor), capacity, schedule.
- Record which teacher is assigned to which class.

**ERD Diagram:**
![International School ERD](imgs/004.png)
