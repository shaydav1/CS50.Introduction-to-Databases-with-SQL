--Passengers
DROP TABLE IF EXISTS "Passengers";
CREATE TABLE Passengers
(
    "id" INTEGER,
    "first_name" Text NOT NULL,
    "last_name" Text NOT NULL,
    "age" INTEGER NOT NULL CHECK("age" >= 0 AND "age" <= 120),
    PRIMARY KEY("id")
);

--Concourses
DROP TABLE IF EXISTS "Concourses";
CREATE TABLE "Concourses"
(
    "id" INTEGER,
    "concourse_name" TEXT NOT NULL UNIQUE,
    PRIMARY KEY ("id")
);

--Airlines
DROP TABLE IF EXISTS "Airlines";
CREATE TABLE "Airlines"
(
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    PRIMARY KEY("id")
);

--Airline_Concourses
DROP TABLE IF EXISTS "Airline_Concourses";
CREATE TABLE "Airline_Concourses"
(
    "airline_id" INTEGER,
    "concourse_id" INTEGER,
    PRIMARY KEY("airline_id", "concourse_id"),
    FOREIGN KEY("airline_id")   REFERENCES "Airlines"("id"),
    FOREIGN KEY("concourse_id") REFERENCES "Concourses"("id")
);

--Flights
DROP TABLE IF EXISTS "Flights";
CREATE TABLE "Flights"
(
    "id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "airline_id" INTEGER NOT NULL,
    "IATA_airport_code_departure" TEXT NOT NULL,
    "IATA_airport_code_arrival" TEXT NOT NULL,
    "departure_time" DATETIME NOT NULL,
    "arrival_time" DATETIME NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "Airlines"("id")
);

--Check-Ins
DROP TABLE IF EXISTS "Check_Ins";
CREATE TABLE Check_Ins
(
    "id" INTEGER,
    "passenger_id" INTEGER NOT NULL,
    "datetime_check_in" datetime NOT NULL,
    "flight_id" int NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES "Passengers"("id"),
    FOREIGN KEY("flight_id")    REFERENCES "Flights"("id")
);
