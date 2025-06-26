/* 2 a. (10 points) Translate the diagram above by writing the SQL CREATE TABLE statements to represent 
                  this E/R diagram. Include all key constraints; you should specify both primary and foreign keys. 
                  Make sure that your statements are syntactically correct (you might want to check them 
                  using SQLite, Azure SQL Server, or another relational database). I removed 
*/
CREATE TABLE InsuranceCo (
  name VARCHAR(50) PRIMARY KEY,
  phone INTEGER
);

CREATE TABLE Vehicle (
  licensePlate VARCHAR(20) PRIMARY KEY,
  year INTEGER,
  ssn INTEGER REFERENCES Person(ssn),
  maxLiability REAL,
  name VARCHAR(50) REFERENCES InsuranceCo(name)
);

CREATE TABLE Person (
  ssn INTEGER PRIMARY KEY,
  name VARCHAR(30)
);

CREATE TABLE Driver (
  driverID INTEGER,
  ssn INTEGER PRIMARY KEY,
  FOREIGN KEY(ssn) REFERENCES Person(ssn)
);

CREATE TABLE NonProfessionalDriver (
  ssn INTEGER PRIMARY KEY,
  FOREIGN KEY(ssn) REFERENCES Driver(ssn)
);

CREATE TABLE ProfessionalDriver (
  medicalHistory VARCHAR(500),
  ssn INTEGER PRIMARY KEY,
  FOREIGN KEY(ssn) REFERENCES Driver(ssn)
);

CREATE TABLE Truck (
  capacity INTEGER,
  ssn INTEGER REFERENCES ProfessionalDriver(ssn),
  licensePlate VARCHAR(100) PRIMARY KEY,
  FOREIGN KEY(licensePlate) REFERENCES Vehicle(licensePlate)
);

CREATE TABLE Car (
  make VARCHAR(100),
  licensePlate VARCHAR(100) PRIMARY KEY,
  FOREIGN KEY(licensePlate) REFERENCES Vehicle(licensePlate)
);

CREATE TABLE Drives (
  licensePlate VARCHAR(100) REFERENCES Vehicle(licensePlate),
  ssn INTEGER REFERENCES NonProfessionalDriver(ssn),
  PRIMARY KEY (licensePlate, ssn)
);



/* b. (5 points) Which relation in your relational schema represents the relationship "insures" 
                 in the E/R diagram? Why is that your representation?

                 Insures, in my relational schema, is included in my Vehicle table. This is because it is
                 a many to one relationship between Vehicle and Insurance company, as one vehicle only has
                 one insurance company, but one insurance company can have many vehicles. The insures relationship
                 does not need its own table as there will only be one licensePlate, name combination between 
                 Vehicle and InsuranceCo, and thus, an additional table would be redundant. The maxLiability property
                 of the relationship was a bit confusing at first, as I did not know where to include it, and 
                 this made me initially think that the Insures relationship be in its own table. Eventually, I 
                 figured that the Vehicle has its own maxLiability policy in real life, and each vehicle of an
                 insurance company will have different max liabilities. 


/* c.(5 points) Compare the representation of the relationships "drives" and "operates" in your schema, 
                and explain why they are different.

                Drives and operates are different in my schema because operates is a many to one relationship
                with a professional driver, while drives is a many to many relation with Car. This means that
                it is sufficient to just include the operates relation inside of the already existing table of 
                Truck, as one Truck and its driver can be identified by just the license plate of the truck. The 
                nonprofessionaldriver drives car relation is a bit more difficult. Since many people can drive the same
                cars, and many cars can be driven by the same person, this is a many-many relation. Because of this, I
                need to include a whole new table with a composite primary key so that a driver and car combination
                can be identified easier. For this, I used the SSN of the driver and the license plate number which are
                foreign keys themselves.