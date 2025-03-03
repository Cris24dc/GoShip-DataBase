# **GoShip Database**  

<img src="./images/logo.png" width="80%">

## **📌 Description**  

The **GoShip database** is designed to manage the logistics and operations of **GoShip**, a distribution company specializing in handling and transporting product orders. Acting as an intermediary between **producers and customers**, GoShip leverages warehouses to optimize delivery routes and ensure efficient logistics.

The database is implemented using **Oracle SQL** and **PL/SQL**, capturing detailed information about **products, categories, orders, customers, producers, employees, and delivery routes**. This repository contains all the necessary scripts and resources for **database creation, population, and interaction**.


## **🚀 Key Features**  

### **📦 Product & Order Management**  
✔ Organizes **products by categories**, linking them to producers.  
✔ Tracks **customer orders**, linking each order to **invoices** and multiple products.  

### **👥 Employee Roles**  
✔ **Handlers** – Responsible for loading and unloading products in warehouses.  
✔ **Drivers** – Manage the transportation of orders to customers.  

### **🚚 Route & Logistics Tracking**  
✔ Defines **delivery routes**, linking **warehouses** to customer locations.  
✔ Assigns **drivers** to specific delivery routes for optimized logistics.  

### **📜 Invoice Management**  
✔ Supports **automated invoice generation** for all placed orders.  


## **📂 Repository Structure**  

<img src="./images/file_structure.png" width="25%">

📌 **Folders Overview:**  
- `schema/` – Contains scripts for **database schema creation**.  
- `data/` – Includes **sample data insertion** scripts.  
- `utils/` – Implements **procedures, functions, triggers, and packages** for database operations.  

## **📊 Diagrams**  

### **📌 Entity-Relationship Diagram**  
<img src="./images/erd.png" width="95%">

### **📌 Conceptual Model**  
<img src="./images/conceptual.png" width="95%">

### **📌 Normalization Process**  
<img src="./images/normalization.png" width="95%">
