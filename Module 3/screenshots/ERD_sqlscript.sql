
CREATE SCHEMA IF NOT EXISTS staging
	AUTHORIZATION postgres;

CREATE TABLE IF NOT EXISTS staging."softcartDimDate"
(
    year integer NOT NULL,
    weekday integer NOT NULL,
    monthname character varying(10) NOT NULL,
    month integer NOT NULL,
    day integer NOT NULL,
    dateid integer NOT NULL PRIMARY KEY,
    date date NOT NULL,
    weekdayname character varying(10) NOT NULL,
    quarter integer NOT NULL,
    quartername character varying(2) NOT NULL
);

CREATE TABLE IF NOT EXISTS staging."softcartDimCategory"
(
    categoryid integer NOT NULL PRIMARY KEY,
    category character varying(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS staging."softcartDimItem"
(
    itemid integer NOT NULL PRIMARY KEY,
    item character varying NOT NULL
);

CREATE TABLE IF NOT EXISTS staging."softcartDimCountry"
(
    countryid integer NOT NULL PRIMARY KEY,
    country character varying(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS staging."softcartFactSales"
(
    dateid integer NOT NULL REFERENCES staging."softcartDimDate" (dateid),
    orderid integer NOT NULL,
    categoryid integer NOT NULL REFERENCES staging."softcartDimCategory" (categoryid),
    countryid integer NOT NULL REFERENCES staging."softcartDimCountry" (countryid),
    price money NOT NULL,
    PRIMARY KEY (orderid)
);

END;