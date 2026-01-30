CREATE TABLE AIRLINES (
Id INT PRIMARY KEY,
Airline varchar (50) UNIQUE,
Abbreviation varchar(30) UNIQUE, 
Country varchar(50)
);

CREATE TABLE AIRPORT (
City varchar(50),
AirportCode char (3) PRIMARY KEY,
AirportName varchar (50),
Country varchar (50), 
CountryAbbrev char (3)
);


CREATE TABLE FLIGHTS (
Airline INT,
FlightNo VARCHAR (10),
SourceAirport char(3),
DestAirport char(3),
PRIMARY KEY (Airline, FlightNo),
CONSTRAINT fk_airline
	FOREIGN KEY (Airline) REFERENCES AIRLINES (Id),
CONSTRAINT fk_airportsource
	FOREIGN KEY (SourceAirport) REFERENCES AIRPORT (AirportCode),
CONSTRAINT fk_airportdest
	FOREIGN KEY (DestAirport) REFERENCES AIRPORT (AirportCode)
);