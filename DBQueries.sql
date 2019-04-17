
CREATE DATABASE GymConferaturDB;

use GymConferaturDB;

alter table Owner add column Owner_Password_Salt varchar(500) NOT NULL;

create table Owner(
   Owner_ID INT NOT NULL AUTO_INCREMENT,
   Owner_Number INT NOT NULL, 
   Owner_Password_Hash varchar(500) NOT NULL,
   Owner_Password_Salt varchar(500) NOT NULL,
   Owner_Name VARCHAR(100) NOT NULL,
   Owner_Address VARCHAR(100) NOT NULL,
   Owner_City VARCHAR(100) NOT NULL,
   Owner_State VARCHAR(100) NOT NULL,
   Owner_Country VARCHAR(100) NOT NULL,
   Owner_Zipcode VARCHAR(100) NOT NULL,
   Created_Date  DATE,
   Updated_Date DATE,
   
   PRIMARY KEY ( Owner_ID )
);

create table Gym(
   Gym_ID INT NOT NULL AUTO_INCREMENT,
   Gym_Number INT NOT NULL, 
   Owner_ID INT NOT NULL,
   Gym_Name VARCHAR(100) NOT NULL,
   Gym_Address VARCHAR(100) NOT NULL,
   Gym_City VARCHAR(100) NOT NULL,
   Gym_State VARCHAR(100) NOT NULL,
   Gym_Country VARCHAR(100) NOT NULL,
   Gym_Zipcode VARCHAR(100) NOT NULL,
   Created_Date  DATE,
   Updated_Date DATE,
   
   PRIMARY KEY ( Gym_ID ),
   
   FOREIGN KEY (Owner_ID)
      REFERENCES Owner(Owner_ID)
      ON UPDATE CASCADE ON DELETE RESTRICT
);



create table Features(
   Feature_ID INT NOT NULL AUTO_INCREMENT,
   Gym_ID INT NOT NULL,
   Price DECIMAL NOT NULL,
   Locations INT  NULL,
   Personal_Training VARCHAR(100)  NULL,
   Member_Count DOUBLE  NULL,
   Merchandise BOOLEAN  NULL,
   Parking BOOLEAN  NULL,
   Amenities  VARCHAR(100)  NULL,
   Recreation BOOLEAN  NULL,
   Pool BOOLEAN  NULL,
   Spin_Studio BOOLEAN  NULL,
   Cardio_Room BOOLEAN  NULL,
   Working_Hours BOOLEAN  NULL,
   Weekend_Meetup BOOLEAN  NULL,
   Created_Date  DATE,
   Updated_Date DATE,
   
   PRIMARY KEY ( Feature_ID ),
   
   FOREIGN KEY (Gym_ID)
      REFERENCES Gym(Gym_ID)
      ON UPDATE CASCADE ON DELETE RESTRICT
);

drop procedure  spSaveOwner;

DELIMITER $$
Alter PROCEDURE spSaveOwner(
  Owner_ID INT,
   Owner_Number INT, 
    Owner_Password_Hash varchar(500),
   Owner_Password_Salt varchar(500) ,
   Owner_Name VARCHAR(100),
   Owner_Address VARCHAR(100),
   Owner_City VARCHAR(100),
   Owner_State VARCHAR(100),
   Owner_Country VARCHAR(100),
   Owner_Zipcode VARCHAR(100)
)

BEGIN

IF Owner_ID IS NULL THEN

INSERT INTO OWNER(Owner_Number, Owner_Name, Owner_Password_Hash, Owner_Password_Salt,Owner_Address, Owner_City, Owner_State, Owner_Country, Owner_Zipcode, Created_Date, Updated_Date) 
VALUES
(Owner_Number, Owner_Name, Owner_Password_Hash, Owner_Password_Salt, Owner_Address, Owner_City, Owner_State, Owner_Country, Owner_Zipcode, Now(), Now()); 

ELSE

UPDATE OWNER SET 
Owner_Number = Owner_Number, Owner_Name=Owner_Name, Owner_Password_Hash= Owner_Password_Hash, Owner_Password_Salt=Owner_Password_Salt, Owner_Address=Owner_Address, Owner_City=Owner_City, Owner_State=Owner_State,
Owner_Country=Owner_Country, Owner_Zipcode=Owner_Zipcode, Updated_Date=Now()
WHERE 
Owner_ID = Owner_ID;


END IF;

END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spSaveGym(
  Gym_ID INT,
  Owner_ID INT,
   Gym_Name VARCHAR(100),
   Gym_Address VARCHAR(100),
   Gym_City VARCHAR(100),
   Gym_State VARCHAR(100),
   Gym_Country VARCHAR(100),
   Gym_Zipcode VARCHAR(100)
)

BEGIN

IF Gym_ID IS NULL THEN

INSERT INTO OWNER(Owner_ID, Gym_Name, Gym_Address, Gym_City, Gym_State, Gym_Country, Gym_Zipcode, Created_Date, Updated_Date) 
VALUES
(Owner_ID, Gym_Name, Gym_Address, Gym_City, Gym_State, Gym_Country, Gym_Zipcode, Now(), Now()) ; 

ELSE

UPDATE OWNER SET 
Owner_ID = Owner_ID, Gym_Name=Gym_Name, Gym_Address=Gym_Address, Gym_City=Gym_City, Gym_State=Gym_State,
Gym_Country=Gym_Country, Gym_Zipcode=Gym_Zipcode, Updated_Date=Now()
WHERE 
Gym_ID = Gym_ID;


END IF;

END$$
DELIMITER ;

DELIMITER $$
Create PROCEDURE spSaveFeatures (
   Feature_ID INT,
   Gym_ID INT,
   Price DECIMAL,
   Locations INT,
   Personal_Training VARCHAR(100) ,
   Member_Count DOUBLE ,
   Merchandise BOOLEAN ,
   Parking BOOLEAN ,
   Amenities  VARCHAR(100) ,
   Recreation BOOLEAN ,
   Pool BOOLEAN ,
   Spin_Studio BOOLEAN ,
   Cardio_Room BOOLEAN ,
   24_Hours BOOLEAN ,
   Weekend_Meetup BOOLEAN
)   

BEGIN

IF Feature_ID IS NULL THEN

INSERT INTO Features(Gym_ID, Price, Locations, Personal_Training, Member_Count, Merchandise, Parking, Amenities, Recreation,
Pool, Spin_Studio, Cardio_Room, 24_Hours, Weekend_Meetup, Created_Date, Updated_Date) 
VALUES
(Gym_ID, Price, Locations, Personal_Training, Member_Count, Merchandise, Parking, Amenities, Recreation,
Pool, Spin_Studio, Cardio_Room, 24_Hours, Weekend_Meetup, Now(), Now()); 

ELSE

UPDATE Features SET 
Gym_ID = Gym_ID, Price=Price, Locations=Locations, Personal_Training=Personal_Training, Member_Count=Member_Count,
Merchandise=Merchandise, Parking=Parking, Amenities=Amenities, Recreation=Recreation, Pool=Pool, Spin_Studio=Spin_Studio, Cardio_Room=Cardio_Room, 
24_Hours=24_Hours,Weekend_Meetup=Weekend_Meetup, Updated_Date=Now()
WHERE 
Feature_ID = Feature_ID;


END IF;

END$$
DELIMITER ;
