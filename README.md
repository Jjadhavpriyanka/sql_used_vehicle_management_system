# Used Vehicle Management Database

## Project Overview
This project is a relational database system designed for managing a used vehicle marketplace. The solution supports vehicle inventory management, buyer and seller administration, order processing, sales tracking, shipping management, search functionality, and business reporting.
The database was designed and implemented using SQL with a focus on scalable architecture, efficient querying, data integrity, and automation. Advanced database concepts including inheritance modelling, indexing strategies, views, stored procedures, triggers, and entity relationship design were applied throughout the project.
The system demonstrates real-world database design practices for managing complex business operations in an online vehicle marketplace. The database structure and relationships are illustrated in the EERD model.

## Dataset Disclaimer
This project was developed as part of Advanced Database module. The business scenario and assessment requirements were supplied by Arden University.  The database design, implementation, SQL development, reporting logic, and documentation represent my own work.

## Business Problem
Used vehicle marketplace require a centralised system capable of managing:
1. Vehicle inventory
2. Buyers and sellers
3. Vehicle sales transactions
4. Orders and delivery tracking
5. Reporting and analytics
6. Search and filtering functionality

Without a structured database, managing relationships between vehicles, users, sales, and logistics becomes difficult and inefficient. This project addresses those challenges through a scalable relational database solution.

## Key Features
### Vehicle Management
1. Vehicle inventory tracking
2. Multiple vehicle categories
3. Vehicle-specific attributes
4. Vehicle ownership management
5. Category hierarchy support

Vehicle categories include:
1. Cars
2. Vans
3. Bikes
4. Trucks

### User Management
The system supports multiple user roles:
1. Buyers
2. Sellers
3. Administrators
A supertype-subtype architecture was implemented to minimise redundancy while maintaining flexibility.

### Sales & Order Management
1. Order creation
2. Purchase tracking
3. Payment status management
4. Sales monitoring
5. Transaction history

### Shipping Management
1. Delivery tracking
2. Carrier monitoring
3. Shipping status updates
4. Estimated and actual delivery dates

### Search Functionality
Users can:
1. Save search filters
2. Define search criteria
3. Retrieve active vehicle searches
4. Monitor inventory demand trends

### Reporting System
1. Custom report generation
2. Vehicle performance reporting
3. Sales analytics
4. Operational insights

## Database Design
### Entity Relationship Model (EERD)
The database consists of multiple interconnected entities designed around business requirements.

Major entities include:
1. Users
2. Buyers
3. Sellers
4. Admins
5. Vehicles
6. Vehicle Categories
7. Cars
8. Vans
9. Bikes
10. Trucks
11. Orders
12. Sales
13. Shipping
14. Search Filters
15. Filter Criteria
16. Reports

### ERD Diagram

## Database Design Techniques
### Supertype-Subtype Modelling
Implemented inheritance hierarchy to reduce redundancy and improve maintainability.

#### User Hierarchy
1. Buyer
2. Seller
3. Admin

#### Vehicle Hierarchy
1. Car
2. Bike
3. Van
4. Truck

### Benefits
1. Reduced null values
2. Better normalisation
3. Easier future expansion
4. Improved data organisation

## Indexing Strategy
Indexes were implemented on frequently queried attributes to improve performance.
1. User email
2. Report status
3. Report creation date
4. Filter names
5. Composite indexes for reporting

### Benefits
1. Faster searches
2. Reduced query execution time
3. Improved scalability

## Data Integrity Controls
The database includes:
1. Primary keys
2. Foreign keys
3. Check constraints
4. Enumerated values
5. Validation triggers

## Advanced SQL Features
### Views

#### ActiveSearchFilters
Provides visibility into active user search preferences.

#### BuyerOrderHistory
Provides complete buyer transaction history.

### Stored Procedures

#### GenerateCustomReport
Generates vehicle sales reports by category within a specified date range.

#### TrackShippingEfficiency
Calculates delivery success rates for carriers.

### Triggers
#### UpdateOrderStatusAfterDelivery
Automatically updates order status when shipping status becomes "Delivered".

## Skills Demonstrated
### Database Design
1. Entity Relationship Modelling
2. EERD Design
3. Database Normalisation
4. Inheritance Modelling

### SQL Development
1. DDL statements
2. DML statements
3. Complex Queries
4. Joins
5. Constraints
6. Indexing

### Database Administration
1. Referential Integrity
2. Data Security
3. Query Optimisation
4. Scalability Planning

## Technologies Used
1. MySQL
2. php
3. SQL
4. Database Modelling Tools










