# `Assignments` – Multiple Dataset Schemas (Walmart, Amazon Books, Orders)

## Overview

- **Datasets**:  
  1. *Walmart Sales Forecasting Dataset* ([Kaggle](https://www.kaggle.com/datasets/mikhail1681/walmart-sales)) – weekly sales across different stores with external influencing factors.  
  2. *Amazon Top 50 Bestselling Books (2009–2019)* ([Kaggle](https://www.kaggle.com/datasets/sootersaalu/amazon-top-50-bestselling-books-2009-2019/data)) – information about bestselling books with ratings, reviews, and genres.  
  3. *Orders & Customers Dataset* ([Google Drive](https://drive.google.com/file/d/1TV-_ObwTBPlVd_lax5IgifvgAmpxJ5MQ/view)) – order management including products, customers, and dates.  

- **Objective**:  
  Design star schemas for each dataset to support analytical queries in sales forecasting, book performance analysis, and order management.  

---

## Schema 1 – Walmart Sales

```mermaid
erDiagram
    Fact_Sales {
        int Sales_ID PK
        int Store_ID FK
        int Date_ID FK
        decimal Temperature
        decimal Fuel_Price
        decimal CPI
        decimal Unemployment
        decimal Weekly_Sales
    }

    Dim_Store {
        int Store_ID PK
        int Store_Number
    }

    Dim_Date {
        int Date_ID PK
        date Date
        int Year
        int Month
        int Day
        boolean Holiday_Flags
    }

    Fact_Sales }o--|| Dim_Store : "Store_ID"
    Fact_Sales }o--|| Dim_Date : "Date_ID"
```

---

## Schema 2 – Amazon Bestselling Books

```mermaid
erDiagram
    Fact_Book {
        int Book_ID PK
        int Info_ID FK
        int Date_ID FK
        decimal Price
    }

    Dim_Book_Info {
        int Info_ID PK
        varchar Name
        varchar Author
        decimal User_Rating
        int Reviews
        varchar Genre
    }

    Dim_Date {
        int Date_ID PK
        int Year
    }

    Fact_Book }o--|| Dim_Book_Info : "Info_ID"
    Fact_Book }o--|| Dim_Date : "Date_ID"
```

---

## Schema 3 – Orders & Customers

```mermaid
erDiagram
    Fact_Orders {
        int OrderNumber PK
        int DateID FK
        int ProductID FK
        int CustomerID FK
        int QuantityOrdered
        decimal PriceEach
        int OrderLineNumber
        decimal Sales
        varchar Status
    }

    Dim_Date {
        int DateID PK
        date OrderDate
        int QTR
        int Month
        int Year
        int Day
    }

    Dim_Product {
        int ProductID PK
        varchar ProductCode
        varchar ProductLine
        decimal MSRP
    }

    Dim_Customer {
        int CustomerID PK
        varchar CustomerCode
        varchar CustomerName
        varchar Phone
        varchar AddressLine1
        varchar AddressLine2
        varchar City
        varchar State
        varchar PostalCode
        varchar Country
        varchar Territory
        varchar ContactLastName
        varchar ContactFirstName
        varchar DealSize
    }

    Fact_Orders }o--|| Dim_Date : "DateID"
    Fact_Orders }o--|| Dim_Product : "ProductID"
    Fact_Orders }o--|| Dim_Customer : "CustomerID"
```
