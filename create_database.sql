USE MASTER;
GO

CREATE DATABASE Colonial_Journey;
GO

USE Colonial_Journey;
GO

CREATE TABLE Planets (
	id INT PRIMARY KEY IDENTITY,
	"Name" VARCHAR(30) NOT NULL
);
GO

CREATE TABLE Spaceports (
	id INT PRIMARY KEY IDENTITY,
	"Name" VARCHAR(50) NOT NULL,
	PlanetId INT NOT NULL,
	CONSTRAINT FK_Spaceports_Planets FOREIGN KEY (PlanetId) REFERENCES Planets(id)
);
GO

CREATE TABLE Spaceships (
	id INT PRIMARY KEY IDENTITY,
	"Name" VARCHAR(50) NOT NULL,
	Manufacturer VARCHAR(30) NOT NULL,
	LightSpeedRate INT NOT NULL DEFAULT 0,
);
GO

CREATE TABLE Colonists (
	id INT PRIMARY KEY IDENTITY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Ucn CHAR(10) UNIQUE NOT NULL,
	BirthDate DATE NOT NULL
);
GO

CREATE TABLE Journeys (
	id INT PRIMARY KEY IDENTITY,
	JourneyStart DATETIME NOT NULL,
	JourneyEnd DATETIME NOT NULL,
	Purpose VARCHAR(20) NULL,
	Ucn CHAR(10) UNIQUE NOT NULL,
	BirthDate DATE NOT NULL,
	DestinationSpaceportId INT ,
	SpaceshipId INT,
	CONSTRAINT FK_Journeys_Spaceports FOREIGN KEY (DestinationSpaceportId) REFERENCES Spaceports(id),
	CONSTRAINT FK_Journeys_Spaceships FOREIGN KEY (SpaceshipId) REFERENCES Spaceships(id)
);
GO

CREATE TABLE TravelCards (
	id INT PRIMARY KEY IDENTITY,
	CardNumber VARCHAR(10) UNIQUE NULL,
	JobDuringJourney VARCHAR(8) NULL,
	ColonistId INT ,
	JourneyId INT,
	CONSTRAINT FK_TravelCards_Colonists FOREIGN KEY (ColonistId) REFERENCES Colonists(id),
	CONSTRAINT FK_TravelCards_Journeys FOREIGN KEY (JourneyId) REFERENCES Journeys(id)
);
GO