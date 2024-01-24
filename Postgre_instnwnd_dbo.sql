-- DROP SCHEMA instnwnd_dbo;

CREATE SCHEMA instnwnd_dbo AUTHORIZATION postgres;

-- DROP SEQUENCE instnwnd_dbo.categories_categoryid_seq;

CREATE SEQUENCE instnwnd_dbo.categories_categoryid_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE instnwnd_dbo.employees_employeeid_seq;

CREATE SEQUENCE instnwnd_dbo.employees_employeeid_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE instnwnd_dbo.orders_orderid_seq;

CREATE SEQUENCE instnwnd_dbo.orders_orderid_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE instnwnd_dbo.products_productid_seq;

CREATE SEQUENCE instnwnd_dbo.products_productid_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE instnwnd_dbo.shippers_shipperid_seq;

CREATE SEQUENCE instnwnd_dbo.shippers_shipperid_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE instnwnd_dbo.suppliers_supplierid_seq;

CREATE SEQUENCE instnwnd_dbo.suppliers_supplierid_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;-- instnwnd_dbo.categories definition

-- Drop table

-- DROP TABLE instnwnd_dbo.categories;

CREATE TABLE instnwnd_dbo.categories (
	categoryid int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	categoryname varchar(15) NOT NULL,
	description text NULL,
	picture bytea NULL,
	CONSTRAINT pk_categories_981578535 PRIMARY KEY (categoryid)
);
CREATE INDEX ix_categories_categoryname ON instnwnd_dbo.categories USING btree (categoryname);


-- instnwnd_dbo.customerdemographics definition

-- Drop table

-- DROP TABLE instnwnd_dbo.customerdemographics;

CREATE TABLE instnwnd_dbo.customerdemographics (
	customertypeid bpchar(10) NOT NULL,
	customerdesc text NULL,
	CONSTRAINT pk_customerdemographics_2021582240 PRIMARY KEY (customertypeid)
);


-- instnwnd_dbo.customers definition

-- Drop table

-- DROP TABLE instnwnd_dbo.customers;

CREATE TABLE instnwnd_dbo.customers (
	customerid bpchar(5) NOT NULL,
	companyname varchar(40) NOT NULL,
	contactname varchar(30) NULL,
	contacttitle varchar(30) NULL,
	address varchar(60) NULL,
	city varchar(15) NULL,
	region varchar(15) NULL,
	postalcode varchar(10) NULL,
	country varchar(15) NULL,
	phone varchar(24) NULL,
	fax varchar(24) NULL,
	CONSTRAINT pk_customers_1013578649 PRIMARY KEY (customerid)
);
CREATE INDEX ix_customers_city ON instnwnd_dbo.customers USING btree (city);
CREATE INDEX ix_customers_companyname ON instnwnd_dbo.customers USING btree (companyname);
CREATE INDEX ix_customers_postalcode ON instnwnd_dbo.customers USING btree (postalcode);
CREATE INDEX ix_customers_region ON instnwnd_dbo.customers USING btree (region);


-- instnwnd_dbo.region definition

-- Drop table

-- DROP TABLE instnwnd_dbo.region;

CREATE TABLE instnwnd_dbo.region (
	regionid int4 NOT NULL,
	regiondescription bpchar(50) NOT NULL,
	CONSTRAINT pk_region_2069582411 PRIMARY KEY (regionid)
);


-- instnwnd_dbo.shippers definition

-- Drop table

-- DROP TABLE instnwnd_dbo.shippers;

CREATE TABLE instnwnd_dbo.shippers (
	shipperid int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	companyname varchar(40) NOT NULL,
	phone varchar(24) NULL,
	CONSTRAINT pk_shippers_1045578763 PRIMARY KEY (shipperid)
);


-- instnwnd_dbo.suppliers definition

-- Drop table

-- DROP TABLE instnwnd_dbo.suppliers;

CREATE TABLE instnwnd_dbo.suppliers (
	supplierid int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	companyname varchar(40) NOT NULL,
	contactname varchar(30) NULL,
	contacttitle varchar(30) NULL,
	address varchar(60) NULL,
	city varchar(15) NULL,
	region varchar(15) NULL,
	postalcode varchar(10) NULL,
	country varchar(15) NULL,
	phone varchar(24) NULL,
	fax varchar(24) NULL,
	homepage text NULL,
	CONSTRAINT pk_suppliers_1077578877 PRIMARY KEY (supplierid)
);
CREATE INDEX ix_suppliers_companyname ON instnwnd_dbo.suppliers USING btree (companyname);
CREATE INDEX ix_suppliers_postalcode ON instnwnd_dbo.suppliers USING btree (postalcode);


-- instnwnd_dbo.customercustomerdemo definition

-- Drop table

-- DROP TABLE instnwnd_dbo.customercustomerdemo;

CREATE TABLE instnwnd_dbo.customercustomerdemo (
	customerid bpchar(5) NOT NULL,
	customertypeid bpchar(10) NOT NULL,
	CONSTRAINT pk_customercustomerdemo_2005582183 PRIMARY KEY (customerid, customertypeid),
	CONSTRAINT fk_customercustomerdemo_2037582297 FOREIGN KEY (customertypeid) REFERENCES instnwnd_dbo.customerdemographics(customertypeid),
	CONSTRAINT fk_customercustomerdemo_customers_2053582354 FOREIGN KEY (customerid) REFERENCES instnwnd_dbo.customers(customerid)
);


-- instnwnd_dbo.employees definition

-- Drop table

-- DROP TABLE instnwnd_dbo.employees;

CREATE TABLE instnwnd_dbo.employees (
	employeeid int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	lastname varchar(20) NOT NULL,
	firstname varchar(10) NOT NULL,
	title varchar(30) NULL,
	titleofcourtesy varchar(25) NULL,
	birthdate timestamp NULL,
	hiredate timestamp NULL,
	address varchar(60) NULL,
	city varchar(15) NULL,
	region varchar(15) NULL,
	postalcode varchar(10) NULL,
	country varchar(15) NULL,
	homephone varchar(24) NULL,
	"extension" varchar(4) NULL,
	photo bytea NULL,
	notes text NULL,
	reportsto int4 NULL,
	photopath varchar(255) NULL,
	CONSTRAINT ck_birthdate_949578421 CHECK ((birthdate < clock_timestamp())),
	CONSTRAINT pk_employees_917578307 PRIMARY KEY (employeeid),
	CONSTRAINT fk_employees_employees_933578364 FOREIGN KEY (reportsto) REFERENCES instnwnd_dbo.employees(employeeid)
);
CREATE INDEX ix_employees_lastname ON instnwnd_dbo.employees USING btree (lastname);
CREATE INDEX ix_employees_postalcode ON instnwnd_dbo.employees USING btree (postalcode);


-- instnwnd_dbo.orders definition

-- Drop table

-- DROP TABLE instnwnd_dbo.orders;

CREATE TABLE instnwnd_dbo.orders (
	orderid int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	customerid bpchar(5) NULL,
	employeeid int4 NULL,
	orderdate timestamp NULL,
	requireddate timestamp NULL,
	shippeddate timestamp NULL,
	shipvia int4 NULL,
	freight numeric(19, 4) NULL DEFAULT 0,
	shipname varchar(40) NULL,
	shipaddress varchar(60) NULL,
	shipcity varchar(15) NULL,
	shipregion varchar(15) NULL,
	shippostalcode varchar(10) NULL,
	shipcountry varchar(15) NULL,
	CONSTRAINT pk_orders_1109578991 PRIMARY KEY (orderid),
	CONSTRAINT fk_orders_customers_1141579105 FOREIGN KEY (customerid) REFERENCES instnwnd_dbo.customers(customerid),
	CONSTRAINT fk_orders_employees_1157579162 FOREIGN KEY (employeeid) REFERENCES instnwnd_dbo.employees(employeeid),
	CONSTRAINT fk_orders_shippers_1173579219 FOREIGN KEY (shipvia) REFERENCES instnwnd_dbo.shippers(shipperid)
);
CREATE INDEX ix_orders_customerid ON instnwnd_dbo.orders USING btree (customerid);
CREATE INDEX ix_orders_customersorders ON instnwnd_dbo.orders USING btree (customerid);
CREATE INDEX ix_orders_employeeid ON instnwnd_dbo.orders USING btree (employeeid);
CREATE INDEX ix_orders_employeesorders ON instnwnd_dbo.orders USING btree (employeeid);
CREATE INDEX ix_orders_orderdate ON instnwnd_dbo.orders USING btree (orderdate);
CREATE INDEX ix_orders_shippeddate ON instnwnd_dbo.orders USING btree (shippeddate);
CREATE INDEX ix_orders_shippersorders ON instnwnd_dbo.orders USING btree (shipvia);
CREATE INDEX ix_orders_shippostalcode ON instnwnd_dbo.orders USING btree (shippostalcode);


-- instnwnd_dbo.products definition

-- Drop table

-- DROP TABLE instnwnd_dbo.products;

CREATE TABLE instnwnd_dbo.products (
	productid int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	productname varchar(40) NOT NULL,
	supplierid int4 NULL,
	categoryid int4 NULL,
	quantityperunit varchar(20) NULL,
	unitprice numeric(19, 4) NULL DEFAULT 0,
	unitsinstock int2 NULL DEFAULT 0,
	unitsonorder int2 NULL DEFAULT 0,
	reorderlevel int2 NULL DEFAULT 0,
	discontinued numeric(1) NOT NULL DEFAULT 0,
	CONSTRAINT ck_products_unitprice_1333579789 CHECK ((unitprice >= (0)::numeric)),
	CONSTRAINT ck_reorderlevel_1349579846 CHECK ((reorderlevel >= 0)),
	CONSTRAINT ck_unitsinstock_1365579903 CHECK ((unitsinstock >= 0)),
	CONSTRAINT ck_unitsonorder_1381579960 CHECK ((unitsonorder >= 0)),
	CONSTRAINT pk_products_1205579333 PRIMARY KEY (productid),
	CONSTRAINT fk_products_categories_1301579675 FOREIGN KEY (categoryid) REFERENCES instnwnd_dbo.categories(categoryid),
	CONSTRAINT fk_products_suppliers_1317579732 FOREIGN KEY (supplierid) REFERENCES instnwnd_dbo.suppliers(supplierid)
);
CREATE INDEX ix_products_categoriesproducts ON instnwnd_dbo.products USING btree (categoryid);
CREATE INDEX ix_products_categoryid ON instnwnd_dbo.products USING btree (categoryid);
CREATE INDEX ix_products_productname ON instnwnd_dbo.products USING btree (productname);
CREATE INDEX ix_products_supplierid ON instnwnd_dbo.products USING btree (supplierid);
CREATE INDEX ix_products_suppliersproducts ON instnwnd_dbo.products USING btree (supplierid);


-- instnwnd_dbo.territories definition

-- Drop table

-- DROP TABLE instnwnd_dbo.territories;

CREATE TABLE instnwnd_dbo.territories (
	territoryid varchar(20) NOT NULL,
	territorydescription bpchar(50) NOT NULL,
	regionid int4 NOT NULL,
	CONSTRAINT pk_territories_2085582468 PRIMARY KEY (territoryid),
	CONSTRAINT fk_territories_region_2101582525 FOREIGN KEY (regionid) REFERENCES instnwnd_dbo.region(regionid)
);


-- instnwnd_dbo."Order Details" definition

-- Drop table

-- DROP TABLE instnwnd_dbo."Order Details";

CREATE TABLE instnwnd_dbo."Order Details" (
	orderid int4 NOT NULL,
	productid int4 NOT NULL,
	unitprice numeric(19, 4) NOT NULL DEFAULT 0,
	quantity int2 NOT NULL DEFAULT 1,
	discount float8 NOT NULL DEFAULT 0,
	CONSTRAINT ck_discount_1509580416 CHECK (((discount >= (0)::double precision) AND (discount <= (1)::double precision))),
	CONSTRAINT ck_quantity_1525580473 CHECK ((quantity > 0)),
	CONSTRAINT ck_unitprice_1541580530 CHECK ((unitprice >= (0)::numeric)),
	CONSTRAINT pk_order_details_1413580074 PRIMARY KEY (orderid, productid),
	CONSTRAINT fk_order_details_orders_1477580302 FOREIGN KEY (orderid) REFERENCES instnwnd_dbo.orders(orderid),
	CONSTRAINT fk_order_details_products_1493580359 FOREIGN KEY (productid) REFERENCES instnwnd_dbo.products(productid)
);
CREATE INDEX "IX_Order Details_OrderID" ON instnwnd_dbo."Order Details" USING btree (orderid);
CREATE INDEX "IX_Order Details_OrdersOrder_Details" ON instnwnd_dbo."Order Details" USING btree (orderid);
CREATE INDEX "IX_Order Details_ProductID" ON instnwnd_dbo."Order Details" USING btree (productid);
CREATE INDEX "IX_Order Details_ProductsOrder_Details" ON instnwnd_dbo."Order Details" USING btree (productid);


-- instnwnd_dbo.employeeterritories definition

-- Drop table

-- DROP TABLE instnwnd_dbo.employeeterritories;

CREATE TABLE instnwnd_dbo.employeeterritories (
	employeeid int4 NOT NULL,
	territoryid varchar(20) NOT NULL,
	CONSTRAINT pk_employeeterritories_2117582582 PRIMARY KEY (employeeid, territoryid),
	CONSTRAINT fk_employeeterritories_employees_2133582639 FOREIGN KEY (employeeid) REFERENCES instnwnd_dbo.employees(employeeid),
	CONSTRAINT fk_employeeterritories_territories_2099048 FOREIGN KEY (territoryid) REFERENCES instnwnd_dbo.territories(territoryid)
);


-- instnwnd_dbo."Current Product List" source

CREATE OR REPLACE VIEW instnwnd_dbo."Current Product List"
AS SELECT product_list.productid,
    product_list.productname
   FROM instnwnd_dbo.products product_list
  WHERE product_list.discontinued = 0::numeric;


-- instnwnd_dbo."Customer and Suppliers by City" source

CREATE OR REPLACE VIEW instnwnd_dbo."Customer and Suppliers by City"
AS SELECT customers.city,
    customers.companyname,
    customers.contactname,
    'Customers'::text AS relationship
   FROM instnwnd_dbo.customers
UNION
 SELECT suppliers.city,
    suppliers.companyname,
    suppliers.contactname,
    'Suppliers'::text AS relationship
   FROM instnwnd_dbo.suppliers;


-- instnwnd_dbo."Products Above Average Price" source

CREATE OR REPLACE VIEW instnwnd_dbo."Products Above Average Price"
AS SELECT products.productname,
    products.unitprice
   FROM instnwnd_dbo.products
  WHERE products.unitprice > (( SELECT avg(products_1.unitprice) AS avg
           FROM instnwnd_dbo.products products_1));



CREATE OR REPLACE PROCEDURE instnwnd_dbo."Employee Sales by Country"(IN par_beginning_date timestamp without time zone, IN par_ending_date timestamp without time zone, INOUT p_refcur refcursor)
 LANGUAGE plpgsql
AS $procedure$
BEGIN
    OPEN p_refcur FOR
    SELECT
        employees.country, employees.lastname, employees.firstname, orders.shippeddate, orders.orderid, "Order Subtotals".subtotal AS saleamount
        FROM instnwnd_dbo.employees
        INNER JOIN (instnwnd_dbo.orders
        INNER JOIN instnwnd_dbo."Order Subtotals"
            ON orders.orderid = "Order Subtotals".orderid)
            ON employees.employeeid = orders.ix_orders_employeeid
        WHERE orders.ix_orders_shippeddate BETWEEN par_Beginning_Date AND par_Ending_Date;
END;
$procedure$
;

CREATE OR REPLACE PROCEDURE instnwnd_dbo."Sales by Year"(IN par_beginning_date timestamp without time zone, IN par_ending_date timestamp without time zone, INOUT p_refcur refcursor)
 LANGUAGE plpgsql
AS $procedure$
BEGIN
    OPEN p_refcur FOR
    SELECT
        orders.shippeddate, orders.orderid, "Order Subtotals".subtotal, to_char(shippeddate::DATE, 'YYYY') AS year
        FROM instnwnd_dbo.orders
        INNER JOIN instnwnd_dbo."Order Subtotals"
            ON orders.orderid = "Order Subtotals".orderid
        WHERE orders.ix_orders_shippeddate BETWEEN par_Beginning_Date AND par_Ending_Date;
END;
$procedure$
;

CREATE OR REPLACE PROCEDURE instnwnd_dbo."Ten Most Expensive Products"(INOUT p_refcur refcursor)
 LANGUAGE plpgsql
AS $procedure$
BEGIN
    /*
    [7674 - Severity CRITICAL - AWS SCT can't convert the ROWCOUNT clause of the SET statement. Convert your source code manually.]
    SET ROWCOUNT 10
    */
    OPEN p_refcur FOR
    SELECT
        products.productname AS tenmostexpensiveproducts, products.unitprice
        FROM instnwnd_dbo.products
        ORDER BY products.unitprice DESC NULLS LAST;
END;
$procedure$
;

CREATE OR REPLACE PROCEDURE instnwnd_dbo.custorderhist(IN par_customerid character, INOUT p_refcur refcursor)
 LANGUAGE plpgsql
AS $procedure$
BEGIN
    OPEN p_refcur FOR
    SELECT
        productname, SUM(quantity) AS total
        FROM instnwnd_dbo.products AS p, instnwnd_dbo."Order Details" AS od, instnwnd_dbo.orders AS o, instnwnd_dbo.customers AS c
        WHERE LOWER(c.customerid) = LOWER(par_CustomerID) AND LOWER(c.customerid) = LOWER(o.customerid) AND o.orderid = od.orderid AND od.productid = p.productid
        GROUP BY productname;
END;
$procedure$
;

CREATE OR REPLACE PROCEDURE instnwnd_dbo.custordersdetail(IN par_orderid integer, INOUT p_refcur refcursor)
 LANGUAGE plpgsql
AS $procedure$
BEGIN
    OPEN p_refcur FOR
    SELECT
        productname, ROUND(od.unitprice, 2) AS unitprice, quantity, CAST (discount * 100 AS INTEGER) AS discount, ROUND(CAST (quantity * (1 - discount) * od.unitprice AS NUMERIC(19, 4)), 2) AS extendedprice
        FROM instnwnd_dbo.products AS p, instnwnd_dbo."Order Details" AS od
        WHERE od.productid = p.productid AND od.orderid = par_OrderID;
END;
$procedure$
;

CREATE OR REPLACE PROCEDURE instnwnd_dbo.custordersorders(IN par_customerid character, INOUT p_refcur refcursor)
 LANGUAGE plpgsql
AS $procedure$
BEGIN
    OPEN p_refcur FOR
    SELECT
        orderid, orderdate, requireddate, shippeddate
        FROM instnwnd_dbo.orders
        WHERE LOWER(customerid) = LOWER(par_CustomerID)
        ORDER BY orderid NULLS FIRST;
END;
$procedure$
;

CREATE OR REPLACE PROCEDURE instnwnd_dbo.salesbycategory(IN par_categoryname character varying, IN par_ordyear character varying DEFAULT '1998'::character varying, INOUT p_refcur refcursor DEFAULT NULL::refcursor)
 LANGUAGE plpgsql
AS $procedure$
BEGIN
    IF LOWER(par_OrdYear) != LOWER('1996') AND LOWER(par_OrdYear) != LOWER('1997') AND LOWER(par_OrdYear) != LOWER('1998') THEN
        SELECT
            '1998'
            INTO par_OrdYear;
    END IF;
    OPEN p_refcur FOR
    SELECT
        productname, ROUND(SUM(CAST (od.quantity * (1 - od.discount) * od.unitprice AS NUMERIC(14, 2))), 0) AS totalpurchase
        FROM instnwnd_dbo."Order Details" AS od, instnwnd_dbo.orders AS o, instnwnd_dbo.products AS p, instnwnd_dbo.categories AS c
        WHERE od.orderid = o.orderid AND od.productid = p.productid AND p.categoryid = c.categoryid AND LOWER(c.categoryname) = LOWER(par_CategoryName) AND LOWER(SUBSTR(aws_sqlserver_ext.conv_datetime_to_string('NVARCHAR(22)', 'DATETIME', o.orderdate, 111), 1, 4)) = LOWER(par_OrdYear)
        GROUP BY productname
        ORDER BY productname NULLS FIRST;
END;
$procedure$
;
