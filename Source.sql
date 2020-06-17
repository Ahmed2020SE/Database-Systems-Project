CREATE TABLE Roads (
	Code int NOT NULL PRIMARY KEY,
    Priority varchar2(45) NOT NULL,
	Average_speed int NOT NULL,
	Divider int NOT NULL,
	Direction varchar2(45) NOT NULL,
	Condition varchar2(5) NOT NULL
); 
CREATE TABLE Radar(
Code int NOT NULL PRIMARY KEY,
Address varchar2(45) NOT NULL,
Camera_type varchar2(45) NOT NULL,
Condition varchar2(5) NOT NULL,
Road_Code int NOT NULL,
FOREIGN KEY(Road_Code) REFERENCES Roads(Code)
);
CREATE TABLE Violations(
Code int NOT NULL PRIMARY KEY,
Description varchar2(255) NOT NULL,
Fine_amount int NOT NULL
);
CREATE TABLE Camera(
Code int NOT NULL PRIMARY KEY,
Type varchar2(45) NOT NULL,
Location varchar2(45) NOT NULL,
Condition varchar2(5) NOT NULL,
Illumination int
);
CREATE TABLE Cars(
Plate_number int NOT NULL PRIMARY KEY,
Driving _License int NOT NULL,
Safety_ratings int NOT NULL,
Fire_extinguisher varchar2(10) NOT NULL,
Type varchar(20) NOT NULL
);
CREATE TABLE Traffic_department(
Code int NOT NULL PRIMARY KEY,
Name varchar2(60) NOT NULL,
Location varchar2(255) NOT NULL
);
CREATE TABLE Driver(
ID int NOT NULL PRIMARY KEY,
Full_Name varchar2(100) NOT NULL,
Address varchar2(100) NOT NULL,
Driver_license varchar2(100) NOT NULL,
Traffic_department_code int NOT NULL,
Phone_number int NOT NULL,
Car_Plate_number int NOT NULL,
FOREIGN KEY(Traffic_department_code) REFERENCES Traffic_department(Code),
FOREIGN KEY(Plate_number) REFERENCES Cars(Plate_number)
);
CREATE TABLE Traffic_Violation(
Car_plate_number int NOT NULL,
Camera_code int NOT NULL,
Radar_code int NOT NULL,
Violation_code int NOT NULL,
Payed char(1) check(Payed in( 'Y', 'N' )),
PRIMARY KEY(Car_plate_number,Camera_code,Radar_code,Violation_code,Payed)
);
ALTER TABLE Traffic_Violation ADD FOREIGN KEY (CAR_PLATE_NUMBER) REFERENCES Cars(Plate_number); 
ALTER TABLE Traffic_Violation ADD FOREIGN KEY (Camera_code) REFERENCES Camera(Code); 
ALTER TABLE Traffic_Violation ADD FOREIGN KEY (Radar_code) REFERENCES Radar(Code); 
ALTER TABLE Traffic_Violation ADD FOREIGN KEY (Violation_code) REFERENCES Violations (Code); 
CREATE SEQUENCE seq_roads
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10; 
