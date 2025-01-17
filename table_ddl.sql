-- Customers table
CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY, -- Customer ID
    FirstName TEXT NOT NULL, -- Customer First Name
    LastName TEXT NOT NULL, -- Customer Last Name
    Email TEXT NOT NULL UNIQUE, -- Customer Email
    Phone TEXT, -- Customer Phone
    Address TEXT, -- Customer Address
    City TEXT, -- Customer City
    State TEXT, -- Customer State
    ZipCode TEXT, -- Customer Zip Code
    Country TEXT -- Customer Country
);

-- Vehicles table
CREATE TABLE Vehicles (
    VehicleID INTEGER PRIMARY KEY, -- Vehicle ID
    CustomerID INTEGER, -- Customer ID
    Make TEXT NOT NULL, -- Vehicle Make
    Model TEXT NOT NULL, -- Vehicle Model
    Year INTEGER NOT NULL, -- Vehicle Year
    VIN TEXT NOT NULL UNIQUE, -- Vehicle VIN
    LicensePlate TEXT, -- Vehicle License Plate
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- ServiceCenters table
CREATE TABLE ServiceCenters (
    ServiceCenterID INTEGER PRIMARY KEY, -- Service Center ID
    Name TEXT NOT NULL, -- Service Center Name
    Address TEXT, -- Service Center Address
    City TEXT, -- Service Center City
    State TEXT, -- Service Center State
    ZipCode TEXT, -- Service Center Zip Code
    Country TEXT, -- Service Center Country
    Phone TEXT, -- Service Center Phone
    Email TEXT -- Service Center Email
);

-- Appointments table
CREATE TABLE Appointments (
    AppointmentID INTEGER PRIMARY KEY, -- Appointment ID
    CustomerID INTEGER, -- Customer ID
    VehicleID INTEGER, -- Vehicle ID
    ServiceCenterID INTEGER, -- Service Center ID
    AppointmentDate TEXT NOT NULL, -- Appointment Date
    Status TEXT, -- Appointment Status
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID),
    FOREIGN KEY (ServiceCenterID) REFERENCES ServiceCenters(ServiceCenterID)
);

-- Services table
CREATE TABLE Services (
    ServiceID INTEGER PRIMARY KEY, -- Service ID
    ServiceName TEXT NOT NULL, -- Service Name
    Description TEXT, -- Service Description
    Price REAL NOT NULL -- Service Price
);

-- AppointmentServices table
CREATE TABLE AppointmentServices (
    AppointmentServiceID INTEGER PRIMARY KEY, -- Appointment Service ID
    AppointmentID INTEGER, -- Appointment ID
    ServiceID INTEGER, -- Service ID
    Quantity INTEGER NOT NULL, -- Service Quantity
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

-- Mechanics table
CREATE TABLE Mechanics (
    MechanicID INTEGER PRIMARY KEY, -- Mechanic ID
    FirstName TEXT NOT NULL, -- Mechanic First Name
    LastName TEXT NOT NULL, -- Mechanic Last Name
    Phone TEXT, -- Mechanic Phone
    Email TEXT, -- Mechanic Email
    ServiceCenterID INTEGER, -- Service Center ID
    FOREIGN KEY (ServiceCenterID) REFERENCES ServiceCenters(ServiceCenterID)
);

-- Parts table
CREATE TABLE Parts (
    PartID INTEGER PRIMARY KEY, -- Part ID
    PartName TEXT NOT NULL, -- Part Name
    Description TEXT, -- Part Description
    Price REAL NOT NULL, -- Part Price
    StockQuantity INTEGER NOT NULL -- Part Stock Quantity
);

-- AppointmentParts table
CREATE TABLE AppointmentParts (
    AppointmentPartID INTEGER PRIMARY KEY, -- Appointment Part ID
    AppointmentID INTEGER, -- Appointment ID
    PartID INTEGER, -- Part ID
    Quantity INTEGER NOT NULL, -- Part Quantity
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID),
    FOREIGN KEY (PartID) REFERENCES Parts(PartID)
);

-- Invoices table
CREATE TABLE Invoices (
    InvoiceID INTEGER PRIMARY KEY, -- Invoice ID
    AppointmentID INTEGER, -- Appointment ID
    InvoiceDate TEXT NOT NULL, -- Invoice Date
    TotalAmount REAL NOT NULL, -- Total Amount
    PaidAmount REAL NOT NULL, -- Paid Amount
    DueAmount REAL NOT NULL, -- Due Amount
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

-- Payments table
CREATE TABLE Payments (
    PaymentID INTEGER PRIMARY KEY, -- Payment ID
    InvoiceID INTEGER, -- Invoice ID
    PaymentDate TEXT NOT NULL, -- Payment Date
    Amount REAL NOT NULL, -- Payment Amount
    PaymentMethod TEXT NOT NULL, -- Payment Method
    FOREIGN KEY (InvoiceID) REFERENCES Invoices(InvoiceID)
);

-- Reviews table
CREATE TABLE Reviews (
    ReviewID INTEGER PRIMARY KEY, -- Review ID
    CustomerID INTEGER, -- Customer ID
    ServiceCenterID INTEGER, -- Service Center ID
    Rating INTEGER NOT NULL, -- Review Rating
    Comments TEXT, -- Review Comments
    ReviewDate TEXT NOT NULL, -- Review Date
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ServiceCenterID) REFERENCES ServiceCenters(ServiceCenterID)
);

-- Employees table
CREATE TABLE Employees (
    EmployeeID INTEGER PRIMARY KEY, -- Employee ID
    FirstName TEXT NOT NULL, -- Employee First Name
    LastName TEXT NOT NULL, -- Employee Last Name
    Email TEXT NOT NULL UNIQUE, -- Employee Email
    Phone TEXT, -- Employee Phone
    Position TEXT, -- Employee Position
    ServiceCenterID INTEGER, -- Service Center ID
    FOREIGN KEY (ServiceCenterID) REFERENCES ServiceCenters(ServiceCenterID)
);

-- EmployeeSchedules table
CREATE TABLE EmployeeSchedules (
    ScheduleID INTEGER PRIMARY KEY, -- Schedule ID
    EmployeeID INTEGER, -- Employee ID
    WorkDate TEXT NOT NULL, -- Work Date
    StartTime TEXT NOT NULL, -- Start Time
    EndTime TEXT NOT NULL, -- End Time
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Inventory table
CREATE TABLE Inventory (
    InventoryID INTEGER PRIMARY KEY, -- Inventory ID
    PartID INTEGER, -- Part ID
    ServiceCenterID INTEGER, -- Service Center ID
    StockQuantity INTEGER NOT NULL, -- Stock Quantity
    FOREIGN KEY (PartID) REFERENCES Parts(PartID),
    FOREIGN KEY (ServiceCenterID) REFERENCES ServiceCenters(ServiceCenterID)
);

-- Suppliers table
CREATE TABLE Suppliers (
    SupplierID INTEGER PRIMARY KEY, -- Supplier ID
    Name TEXT NOT NULL, -- Supplier Name
    ContactName TEXT, -- Supplier Contact Name
    Phone TEXT, -- Supplier Phone
    Email TEXT, -- Supplier Email
    Address TEXT, -- Supplier Address
    City TEXT, -- Supplier City
    State TEXT, -- Supplier State
    ZipCode TEXT, -- Supplier Zip Code
    Country TEXT -- Supplier Country
);

-- Orders table
CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY, -- Order ID
    SupplierID INTEGER, -- Supplier ID
    OrderDate TEXT NOT NULL, -- Order Date
    TotalAmount REAL NOT NULL, -- Total Amount
    Status TEXT, -- Order Status
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INTEGER PRIMARY KEY, -- Order Detail ID
    OrderID INTEGER, -- Order ID
    PartID INTEGER, -- Part ID
    Quantity INTEGER NOT NULL, -- Part Quantity
    Price REAL NOT NULL, -- Part Price
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (PartID) REFERENCES Parts(PartID)
);

-- Warranties table
CREATE TABLE Warranties (
    WarrantyID INTEGER PRIMARY KEY, -- Warranty ID
    VehicleID INTEGER, -- Vehicle ID
    WarrantyProvider TEXT NOT NULL, -- Warranty Provider
    StartDate TEXT NOT NULL, -- Warranty Start Date
    EndDate TEXT NOT NULL, -- Warranty End Date
    CoverageDetails TEXT, -- Warranty Coverage Details
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);