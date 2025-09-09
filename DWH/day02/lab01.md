# `lab01` – Flight Delay & Cancellation Dataset Schema

## Overview

- **Dataset**: *Flight Delay and Cancellation Dataset (2019–2023)* by Patrick Zelazko on Kaggle.  
  Includes subsets ranging from the full ~29 million flights to a sampled ~3 million rows (`flights_sample_3m.csv`) for efficient analysis. ([kaggle.com](https://www.kaggle.com/datasets/patrickzel/flight-delay-and-cancellation-dataset-2019-2023?utm_source=chatgpt.com))  
- **Objective**: Design a data warehouse schema (star schema) to support analytical reporting on flight performance, delays, cancellations, and related metrics.

## Schema Design

Below is the **Mermaid ER diagram** representing the schema I developed for this lab:

```mermaid
erDiagram
    Fact_Flight {
        int FL_ID PK
        int FL_NUMBER
        int DATE_ID FK
        int DOT_CODE FK
        int ORIGIN_ID FK
        int DEST_ID FK
        int DELAY_ID FK
        int CANCELLLATION_ID FK
        int AIR_ID FK
    }

    Dim_Date {
        int DATE_ID PK
        date FL_DATE
        int DAY
        int MONTH
        int YEAR
    }

    Dim_Airline {
        int DOT_CODE PK
        varchar AIRLINE_CODE
        varchar AIRLINE_DOT
        varchar AIRLINE_NAME
    }

    Dim_Departure {
        int ORIGIN_ID PK
        varchar ORGIN_AIRPORT
        varchar ORIGIN_CITY
        int CRS_DEP_TIME
        int DEP_TIME
        int DEP_DELAY
        int TAXI_OUT
        int WHEELS_OFF
    }

    Dim_Arrival {
        int DEST_ID PK
        varchar DEST_CITY
        int WHEELS_ON
        int TAXI_IN
        int CRS_ARR_TIME
        int ARR_TIME
        int ARR_DELAY
    }

    Dim_Cancellation {
        int CANCELLLATION_ID PK
        varchar CANCELLATION_CODE
        boolean CANCELLED
    }

    Dim_Delay {
        int DELAY_ID PK
        int CARRIER_DELAY
        int WEATHER_DELAY
        int NAS_DELAY
        int SECURITY_DELAY
        int LATE_AIRCRAFT_DELAY
    }

    FL_Air {
        int AIR_ID PK
        int DISTANCE
        int CRS_ELAPSED_TIME
        int ELAPSED_TIME
        int AIR_TIME
        int DIVERTED
    }

    Fact_Flight }o--|| Dim_Date : "DATE_ID"
    Fact_Flight }o--|| Dim_Airline : "DOT_CODE"
    Fact_Flight }o--|| Dim_Departure : "ORIGIN_ID"
    Fact_Flight }o--|| Dim_Arrival : "DEST_ID"
    Fact_Flight }o--|| Dim_Cancellation : "CANCELLLATION_ID"
    Fact_Flight }o--|| Dim_Delay : "DELAY_ID"
    Fact_Flight }o--|| FL_Air : "AIR_ID"

```
