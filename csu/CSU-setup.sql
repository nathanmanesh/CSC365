CREATE TABLE CAMPUSES(

    Id INT PRIMARY KEY,
    Campus varchar(200) NOT NULL,
    Location varchar(100) NOT NULL,
    County varchar(100) NOT NULL,
    Year INT NOT NULL
);

CREATE TABLE DISCIPLINES(

    Id INT PRIMARY KEY,
    Name varchar(100) NOT NULL

);

CREATE TABLE CSU_FEES(

    Campus INT NOT NULL,
    Year INT NOT NULL,
    CampusFee INT NOT NULL,
    PRIMARY KEY (Campus, Year),
    
    CONSTRAINT `fk_fees_campus`
        FOREIGN KEY (Campus) REFERENCES CAMPUSES(Id)
    
);

CREATE TABLE DEGREES(

    Year INT NOT NULL,
    Campus INT NOT NULL,
    Degrees INT NOT NULL,
    PRIMARY KEY (Year, Campus),
    CONSTRAINT `fk_degrees_campus`
        FOREIGN KEY (Campus) REFERENCES CAMPUSES(Id)

);



CREATE TABLE DISCIPLINE_ENROLLMENTS(
    
    Campus INT,
    Discipline INT NOT NULL,
    Year INT NOT NULL,
    Undergraduate INT NOT NULL,
    Graduate INT NOT NULL,
    
    PRIMARY KEY (Campus, Discipline, Year),
    
    CONSTRAINT `fk_disc_enr_campus`
        FOREIGN KEY (Campus) REFERENCES CAMPUSES(Id),
        
    CONSTRAINT `fk_disc_enr_discipline`
        FOREIGN KEY (Discipline) REFERENCES DISCIPLINES(Id)
    
);



CREATE TABLE ENROLLMENTS(

    Campus INT NOT NULL,
    Year INT NOT NULL,
    TotalEnrollment_AY INT NOT NULL,
    FTE_AY INT NOT NULL,
    
    PRIMARY KEY (Campus, Year),
    
    CONSTRAINT `fk_enrollments_campus`
        FOREIGN KEY (Campus) REFERENCES CAMPUSES(Id)

);


CREATE TABLE FACULTY(

    Campus INT NOT NULL,
    Year INT NOT NULL,
    Faculty INT NOT NULL,
    
    PRIMARY KEY (Campus, Year),
    
    CONSTRAINT `fk_faculty_campus`
        FOREIGN KEY (Campus) REFERENCES CAMPUSES(Id)
    
);