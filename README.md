# Modern Data Warehouse Project

## 📝 Project Overview

This project implements a **Modern Data Warehouse** using **PostgreSQL**, structured with the **Medallion Architecture** (Bronze, Silver, and Gold layers). It integrates and analyzes structured data from **CRM (Customer Relationship Management)** and **ERP (Enterprise Resource Planning)** systems.

---

## 🔹 Key Features

### **Data Integration**
- Combining structured CRM and ERP data into a unified data warehouse.

### **ETL Pipelines**
- **Extract, Transform, and Load (ETL)** processes implemented using **SQL** to ensure data is cleaned, transformed, and loaded efficiently.

### **Data Modeling**
- Utilizes a **Star Schema** with **fact and dimension tables** for optimized query performance and analytical reporting.

### **Scalability**
- Designed to handle large datasets and support efficient analytical queries, ensuring scalability as data grows.

---

## � Architecture Overview

### **Medallion Architecture Layers**
1. **Bronze Layer**: Raw data ingestion from CRM and ERP systems.
2. **Silver Layer**: Cleaned and transformed data, ready for analysis.
3. **Gold Layer**: Aggregated and enriched data for business reporting and insights.

---

## 🛠️ Tools & Technologies
- **Database**: PostgreSQL
- **ETL**: SQL-based pipelines
- **Data Modeling**: Star Schema
- **Data Sources**: CRM & ERP systems

---

## 📂 Project Structure
![](https://www.googleapis.com/download/storage/v1/b/kaggle-user-content/o/inbox%2F23961675%2F445f365ea1905a97dff13af6d7318612%2Ffile_structure.jpg?generation=1739372274632451&alt=media) <br>


---

## 🚀 Getting Started

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/DataBells/data_warehouse_sql.git

## 🛠️ Set Up PostgreSQL

### 1. **Install PostgreSQL**
   - Download and install PostgreSQL from the official website: [https://www.postgresql.org/download/](https://www.postgresql.org/download/).
   - Follow the installation wizard to complete the setup.

### 2. **Create a Database**
   - Open **pgAdmin** or the **psql** command-line tool.
   - Run the following SQL command to create a new database:
     ```sql
     CREATE DATABASE modern_data_warehouse;
     ```

### 3. **Configure Connection Details**
   - Update the connection details in the project configuration file (e.g., `config.json` or environment variables) with the following:
     ```json
     {
       "host": "localhost",
       "port": 5432,
       "database": "modern_data_warehouse",
       "user": "your_username",
       "password": "your_password"
     }
     ```

---

## 🚀 Run ETL and Explore Data Models Pipelines

### 1. **Navigate to the scripts Folder**
   - Open the `scripts/` folder in your project directory.

### 2. **Execute SQL Scripts**
   - Run the SQL scripts in the following order to load data into the Bronze, Silver, and Gold layers
## 📄 License
This project is licensed under the MIT License. 

## 🙌 Contributing
Contributions are welcome! Please open an issue or submit a pull request for any improvements.

This markdown provides a structured overview of your Modern Data Warehouse project, including key features, architecture, tools, and setup instructions. Let me know if you need further customization! 🚀
