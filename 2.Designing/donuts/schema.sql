DROP TABLE IF EXISTS "order_items";
DROP TABLE IF EXISTS "donut_ingredient";
DROP TABLE IF EXISTS "orders";
DROP TABLE IF EXISTS "donuts";
DROP TABLE IF EXISTS "ingredients";
DROP TABLE IF EXISTS "customers";


/*Ingredients
We certainly need to keep track of our ingredients.
Some of the typical ingredients we use include flour, yeast, oil, butter, and several different types of sugar.
Moreover, we would love to keep track of the price we pay per unit of ingredient (whether it’s pounds, grams, etc.).*/
CREATE TABLE "ingredients"
(
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE ,
    "unit" TEXT,
    "price" NUMERIC,
    PRIMARY KEY("id")
);

/*Donuts
We’ll need to include our selection of donuts, past and present! For each donut on the menu, we’d love to include three things:

The name of the donut
Whether the donut is gluten-free
The price per donut
Oh, and it’s important that we be able to look up the ingredients for each of the donuts!*/
CREATE TABLE "donuts"
(
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "gluten-free" INTEGER NOT NULL CHECK("gluten-free" in (0,1)),
    "price" NUMERIC NOT NULL CHECK("price" >= 0),
    PRIMARY KEY("id")
);

/*Customers
Oh, and we realize it would be lovely to keep track of some information about each of our customers.
We’d love to remember the history of the orders they’ve made. In that case, we think we should store:

A customer’s first and last name
A history of their orders*/
CREATE TABLE "customers"
(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY("id")
);

/*Orders
We love to see customers in person, though we realize a good number of people might order online nowadays.
We’d love to be able to keep track of those online orders. We think we would need to store:

An order number, to keep track of each order internally
All the donuts in the order
The customer who placed the order. We suppose we could assume only one customer places any given order.*/
CREATE TABLE "orders"
(
    "order_number" INTEGER,
    "customer_id" INTEGER NOT NULL,
    PRIMARY KEY("order_number"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE "donut_ingredient"
(
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    PRIMARY KEY("donut_id", "ingredient_id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "order_items"
(
    "order_id" INTEGER NOT NULL,
    "donut_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL CHECK("quantity" > 0) ,
    PRIMARY KEY("order_id", "donut_id"),
    FOREIGN KEY("order_id") REFERENCES "orders"("order_number"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);
