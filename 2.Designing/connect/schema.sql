--dropping child tables first
DROP TABLE IF EXISTS "connections_with_people";
DROP TABLE IF EXISTS "connections_with_schools";
DROP TABLE IF EXISTS "connections_with_companies";

/*Users
The heart of LinkedIn’s platform is its people. Your database should be able to represent the following information about LinkedIn’s users:

Their first and last name
Their username
Their password*/
DROP TABLE IF EXISTS "users";
CREATE TABLE "users"
(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

 /*Schools and Universities
LinkedIn also allows for official school or university accounts, such as that for Harvard, so alumni (i.e., those who’ve attended)
can identify their affiliation. Ensure that LinkedIn’s database can store the following information about each school:

The name of the school
The type of school (e.g., “Elementary School”, “Middle School”, “High School”, “Lower School”, “Upper School”, “College”, “University”, etc.)
The school’s location
The year in which the school was founded*/
DROP TABLE IF EXISTS "schools_and_universities";
CREATE TABLE "schools_and_universities"
(
    "id" INTEGER,
    "school_name" TEXT NOT NULL UNIQUE,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "foundation_year" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

/*Companies
LinkedIn allows companies to create their own pages, like the one for LinkedIn itself,
so employees can identify their past or current employment with the company.
Ensure that LinkedIn’s database can store the following information for each company:

The name of the company
The company’s industry (e.g., “Education”, “Technology, “Finance”, etc.)
The company’s location*/
DROP TABLE IF EXISTS "companies";
CREATE TABLE "companies"
(
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);

/*Connections with People
LinkedIn’s database should be able to represent mutual (reciprocal, two-way) connections between users.
No need to worry about one-way connections, such as user A “following” user B without user B “following” user A.*/
CREATE TABLE "connections_with_people"
(   "id" INTEGER,
    "user_a_id" INTEGER NOT NULL,
    "user_b_id" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_a_id") REFERENCES "users"("id"),
    FOREIGN KEY("user_b_id") REFERENCES "users"("id"),
    CHECK("user_a_id" < "user_b_id"),
    UNIQUE("user_a_id", "user_b_id")
);

/*Connections with Schools
A user should be able to create an affiliation with a given school. And similarly, that school should be able to find its alumni.
Additionally, allow a user to define:

The start date of their affiliation (i.e., when they started to attend the school)
The end date of their affiliation (i.e., when they graduated), if applicable
The type of degree earned/pursued (e.g., “BA”, “MA”, “PhD”, etc.)*/
CREATE TABLE "connections_with_schools"
(
    "id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "school_id" INTEGER NOT NULL,
    "start_date" DATETIME NOT NULL,
    "end_date" DATETIME CONSTRAINT CheckEndLaterThanStart CHECK (end_date >= start_date),
    "degree_type" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools_and_universities"("id")
);

/*Connections with Companies
A user should be able to create an affiliation with a given company.
And similarly, a company should be able to find its current and past employees. Additionally, allow a user to define:

The start date of their affiliation (i.e., the date they began work with the company)
The end date of their affiliation (i.e., when left the company), if applicable
The title they held while affiliated with the company*/
CREATE TABLE "connections_with_companies"
(
    "id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "company_id" INTEGER NOT NULL,
    "start_date" DATETIME NOT NULL,
    "end_date" DATETIME CONSTRAINT CheckEndLaterThanStart CHECK (end_date >= start_date),
    "title" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);
