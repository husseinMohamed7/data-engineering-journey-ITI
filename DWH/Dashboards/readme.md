# Sales Analysis

This project demonstrates a complete **sales data analysis workflow** using **Snowflake** as the data warehouse and **Power BI** as the visualization layer.  
The data model follows a **Star Schema** design for efficient querying and analytics.

---

## Data Model

The schema `STAR_SCH` contains a **fact table** for sales transactions and several **dimension tables** describing related business entities such as products, customers, stores, salespersons, and campaigns.

```mermaid
erDiagram
    STAR_SCH_DIM_DATES {
        NUMBER DATE_SK
        NUMBER YEAR
        NUMBER MONTH
        NUMBER QUARTER
        NUMBER WEEKDAY
        NUMBER DAY
        DATE FULL_DATE
    }

    STAR_SCH_DIM_PRODUCTS {
        NUMBER PRODUCT_SK
        TEXT PRODUCT_ID
        TEXT PRODUCT_NAME
        TEXT CATEGORY
        TEXT BRAND
        TEXT ORIGIN_LOCATION
    }

    STAR_SCH_DIM_CUSTOMERS {
        NUMBER CUSTOMER_SK
        TEXT CUSTOMER_ID
        TEXT FIRST_NAME
        TEXT LAST_NAME
        TEXT EMAIL
        TEXT CUSTOMER_SEGMENT
        TEXT RESIDENTIAL_LOCATION
    }

    STAR_SCH_DIM_STORES {
        NUMBER STORE_SK
        TEXT STORE_ID
        TEXT STORE_NAME
        TEXT STORE_TYPE
        TEXT STORE_LOCATION
        NUMBER STORE_MANAGER_SK
    }

    STAR_SCH_DIM_SALESPERSON {
        NUMBER SALESPERSON_SK
        TEXT SALESPERSON_ID
        TEXT SALESPERSON_NAME
        TEXT SALESPERSON_ROLE
    }

    STAR_SCH_DIM_CAMPAIGNS {
        NUMBER CAMPAIGN_SK
        TEXT CAMPAIGN_ID
        TEXT CAMPAIGN_NAME
        NUMBER CAMPAIGN_BUDGET
        NUMBER START_DATE_SK
        NUMBER END_DATE_SK
    }

    STAR_SCH_FACT_SALES {
        NUMBER SALES_SK
        TEXT SALES_ID
        NUMBER DATE_SK
        NUMBER PRODUCT_SK
        NUMBER STORE_SK
        NUMBER CUSTOMER_SK
        NUMBER SALESPERSON_SK
        NUMBER CAMPAIGN_SK
        NUMBER TOTAL_AMOUNT
        TIMESTAMP_NTZ SALES_DATE
    }

    %% العلاقات
    STAR_SCH_FACT_SALES }o--|| STAR_SCH_DIM_DATES : "DATE_SK"
    STAR_SCH_FACT_SALES }o--|| STAR_SCH_DIM_PRODUCTS : "PRODUCT_SK"
    STAR_SCH_FACT_SALES }o--|| STAR_SCH_DIM_CUSTOMERS : "CUSTOMER_SK"
    STAR_SCH_FACT_SALES }o--|| STAR_SCH_DIM_STORES : "STORE_SK"
    STAR_SCH_FACT_SALES }o--|| STAR_SCH_DIM_SALESPERSON : "SALESPERSON_SK"
    STAR_SCH_FACT_SALES }o--|| STAR_SCH_DIM_CAMPAIGNS : "CAMPAIGN_SK"
```
# Process Overview

## Data Source Integration
- Snowflake was connected to Power BI using the native connector.  
- The `STAR_SCH` schema tables were imported directly for modeling and visualization.

## Data Modeling
- A central **Fact Table (`FACT_SALES`)** stores transactional data.  
- **Dimension Tables** provide descriptive context for analytical slicing (time, customer, product, etc.).  
- Relationships were defined in Power BI following the standard **star schema design**.

## Visualization
Multiple Power BI reports and dashboards were created to analyze:
- Sales trends over time  
- Top-performing products and categories  
- Regional performance by store  
- Campaign effectiveness  
- Salesperson performance

## Power BI Dashboards
Below are screenshots from the interactive dashboards built in Power BI:


![001](imgs/001.png)

![002](imgs/002.png)

![003](imgs/003.png)

![004](imgs/004.png)

![005](imgs/005.png)

![006](imgs/006.png)
