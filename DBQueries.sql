
CREATE DATABASE GymConferaturDB;

use GymConferaturDB;

create table Owner(
   Owner_ID INT NOT NULL AUTO_INCREMENT,
   Owner_Number INT NOT NULL, 
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
   Gym_Name VARCHAR(100) NOT NULL,
   Gym_Address VARCHAR(100) NOT NULL,
   Gym_City VARCHAR(100) NOT NULL,
   Gym_State VARCHAR(100) NOT NULL,
   Gym_Country VARCHAR(100) NOT NULL,
   Gym_Zipcode VARCHAR(100) NOT NULL,
   Created_Date  DATE,
   Updated_Date DATE,
   
   PRIMARY KEY ( Feature_ID ),
   
   FOREIGN KEY (Gym_ID)
      REFERENCES Gym(Gym_ID)
      ON UPDATE CASCADE ON DELETE RESTRICT
);

DELIMITER $$
Create PROCEDURE spSaveOwner(
  Owner_ID INT,
   Owner_Number INT, 
   Owner_Name VARCHAR(100),
   Owner_Address VARCHAR(100),
   Owner_City VARCHAR(100),
   Owner_State VARCHAR(100),
   Owner_Country VARCHAR(100),
   Owner_Zipcode VARCHAR(100),
   Created_Date  DATE,
   Updated_Date DATE
)

BEGIN

IF Owner_ID IS NULL THEN

INSERT INTO OWNER(Owner_Number, Owner_Name, Owner_Address, Owner_City, Owner_State, Owner_Country, Owner_Zipcode, Created_Date, Updated_Date) 
VALUES
(Owner_Number, Owner_Name, Owner_Address, Owner_City, Owner_State, Owner_Country, Owner_Zipcode, Created_Date, Updated_Date); 

ELSE

UPDATE OWNER SET 
Owner_Number = Owner_Number, Owner_Name=Owner_Name, Owner_Address=Owner_Address, Owner_City=Owner_City, Owner_State=Owner_State,
Owner_Country=Owner_Country, Owner_Zipcode=Owner_Zipcode, Updated_Date=Updated_Date
WHERE 
Owner_ID = Owner_ID;


END IF;

END$$
DELIMITER ;

DELIMITER $$
Create PROCEDURE spSaveGym(
  Gym_ID INT,
  Owner_ID INT,
   Gym_Name VARCHAR(100),
   Gym_Address VARCHAR(100),
   Gym_City VARCHAR(100),
   Gym_State VARCHAR(100),
   Gym_Country VARCHAR(100),
   Gym_Zipcode VARCHAR(100),
   Created_Date  DATE,
   Updated_Date DATE
)

BEGIN

IF Gym_ID IS NULL THEN

INSERT INTO OWNER(Owner_ID, Gym_Name, Gym_Address, Gym_City, Gym_State, Gym_Country, Gym_Zipcode, Created_Date, Updated_Date) 
VALUES
(Owner_ID, Gym_Name, Gym_Address, Gym_City, Gym_State, Gym_Country, Gym_Zipcode, Created_Date, Updated_Date) ; 

ELSE

UPDATE OWNER SET 
Owner_ID = Owner_ID, Gym_Name=Gym_Name, Gym_Address=Gym_Address, Gym_City=Gym_City, Gym_State=Gym_State,
Gym_Country=Gym_Country, Gym_Zipcode=Gym_Zipcode, Updated_Date=Updated_Date
WHERE 
Gym_ID = Gym_ID;


END IF;

END$$
DELIMITER ;

DELIMITER $$
Create PROCEDURE spSaveOwner(
  Owner_ID INT,
   Owner_Number INT, 
   Owner_Name VARCHAR(100),
   Owner_Address VARCHAR(100),
   Owner_City VARCHAR(100),
   Owner_State VARCHAR(100),
   Owner_Country VARCHAR(100),
   Owner_Zipcode VARCHAR(100),
   Created_Date  DATE,
   Updated_Date DATE
)

BEGIN

IF Owner_ID IS NULL THEN

INSERT INTO OWNER(Owner_Number, Owner_Name, Owner_Address, Owner_City, Owner_State, Owner_Country, Owner_Zipcode, Created_Date, Updated_Date) 
VALUES
(Owner_Number, Owner_Name, Owner_Address, Owner_City, Owner_State, Owner_Country, Owner_Zipcode, Created_Date, Updated_Date); 

ELSE

UPDATE OWNER SET 
Owner_Number = Owner_Number, Owner_Name=Owner_Name, Owner_Address=Owner_Address, Owner_City=Owner_City, Owner_State=Owner_State,
Owner_Country=Owner_Country, Owner_Zipcode=Owner_Zipcode, Updated_Date=Updated_Date
WHERE 
Owner_ID = Owner_ID;


END IF;

END$$
DELIMITER ;
