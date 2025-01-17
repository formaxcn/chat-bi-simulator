# chat-bi-simulator
## Overview

This project consists of two main components:

1. **Database Schema Definition (DDL)**: The SQL script `TABLE_DDL.SQL` contains the schema definitions for various tables used in the application.
2. **Data Generation Notebook (GENERATE-DATA.IPYNB)**: The Jupyter notebook `GENERATE-DATA.IPYNB` contains Python code to generate and insert simulated data into the database.

## Database Schema

The database schema includes the following tables:

- `Customers`: Stores customer information.
- `Vehicles`: Stores vehicle information associated with customers.
- `ServiceCenters`: Stores information about service centers.
- `Appointments`: Stores appointment details for vehicle services.
- `Services`: Stores information about different services offered.
- `AppointmentServices`: Stores details about services provided during appointments.
- `Mechanics`: Stores information about mechanics working at service centers.
- `Parts`: Stores information about parts available for services.
- `AppointmentParts`: Stores details about parts used during appointments.
- `Invoices`: Stores invoice details for appointments.
- `Payments`: Stores payment details for invoices.
- `Reviews`: Stores customer reviews for service centers.
- `Employees`: Stores information about employees working at service centers.
- `EmployeeSchedules`: Stores work schedules for employees.
- `Inventory`: Stores inventory details of parts at service centers.
- `Suppliers`: Stores information about suppliers providing parts.
- `Orders`: Stores order details for parts from suppliers.
- `OrderDetails`: Stores details about parts in each order.
- `Warranties`: Stores warranty information for vehicles.

## Data Generation

The data generation notebook uses the `Faker` library to generate realistic data for the tables. The notebook includes functions to insert data into each table, handling relationships and constraints.

### Example Functions

- `insert_customers(num_records)`: Inserts a specified number of customer records.
- `insert_service_centers(num_records)`: Inserts a specified number of service center records.
- `insert_vehicles(num_records)`: Inserts a specified number of vehicle records.
- `insert_services()`: Inserts predefined service records.
- `insert_mechanics(num_records)`: Inserts a specified number of mechanic records.
- `insert_parts(num_records)`: Inserts a specified number of part records.
- `insert_appointments(num_records)`: Inserts a specified number of appointment records.
- `insert_appointment_services(num_records)`: Inserts a specified number of appointment service records.
- `insert_appointment_parts(num_records)`: Inserts a specified number of appointment part records.
- `insert_invoices(num_records)`: Inserts a specified number of invoice records.
- `insert_payments(num_records)`: Inserts a specified number of payment records.
- `insert_reviews(num_records)`: Inserts a specified number of review records.
- `insert_employees(num_records)`: Inserts a specified number of employee records.
- `insert_employee_schedules(num_records)`: Inserts a specified number of employee schedule records.
- `insert_inventory(num_records)`: Inserts a specified number of inventory records.
- `insert_suppliers(num_records)`: Inserts a specified number of supplier records.
- `insert_orders(num_records)`: Inserts a specified number of order records.
- `insert_order_details(num_records)`: Inserts a specified number of order detail records.
- `insert_warranties(num_records)`: Inserts a specified number of warranty records.

## Running the Project

1. **Set up the database**: Run the SQL script `TABLE_DDL.SQL` to create the database schema.
2. **Generate data**: Open the Jupyter notebook `GENERATE-DATA.IPYNB` and run the cells to generate and insert data into the database.

## Dependencies

- `sqlite3`: SQLite database library.
- `faker`: Library for generating fake data.
- `random`: Python's built-in random number generation library.

Ensure you have these dependencies installed before running the notebook.