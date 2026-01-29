CREATE TABLE CONTINENTS(

    ContID INT PRIMARY KEY,
    Continent varchar(100) NOT NULL

);

CREATE TABLE COUNTRIES(

    CountryId INT PRIMARY KEY,
    CountryName varchar(100),
    Continent INT NOT NULL, 
    
    CONSTRAINT `fk_countries_cont`
        FOREIGN KEY (Continent) REFERENCES CONTINENTS(ContID)

);


CREATE TABLE CAR_MAKERS(

    Id INT PRIMARY KEY,
    Maker varchar(100) NOT NULL,
    FullName varchar(100) NOT NULL,
    Country INT NOT NULL,
    
    CONSTRAINT `fk_cars_countries`
        FOREIGN KEY (Country) REFERENCES COUNTRIES(CountryId)
    

);

CREATE TABLE MODEL_LIST(

    ModelId INT PRIMARY KEY,
    Maker INT NOT NULL,
    Model varchar(100) NOT NULL,
    
    CONSTRAINT `uq_modelList_model` UNIQUE (Model),
    
    CONSTRAINT `fk_model_maker`
        FOREIGN KEY (Maker) REFERENCES CAR_MAKERS(Id)

);


CREATE TABLE CAR_NAMES(

    MakeId INT PRIMARY KEY,
    Model varchar(100) NOT NULL,
    
    MakeDescription varchar(100) NOT NULL,
    
    CONSTRAINT `fk_car_model`
        FOREIGN KEY (Model) REFERENCES MODEL_LIST(Model)
    
    
);

CREATE TABLE CAR_DATA(

    Id INT PRIMARY KEY,
    MPG INT,
    Cylinders INT,
    Edispl INT,
    Horsepower INT,
    Weight INT,
    Accelerate INT,
    Year INT,
    
    CONSTRAINT `fk_car_make`
        FOREIGN KEY (Id) REFERENCES CAR_NAMES(MakeId)

);