#create database orders;

use orders;

CREATE TABLE Supplier(
		Supplier_ID int(11) auto_increment primary KEY,
        Company_Name varchar(25) default null,
        Contact_Name varchar(25) default null,
        City varchar(25) default null,
        Country varchar(25) default null,
        Phone int(10) default null,
        Fax int(12) default null);
        

CREATE TABLE Product(
		Product_ID int(11) auto_increment primary KEY,
        Product_Name varchar(225) default null,
        Supplier_ID int(11) default null,
        Unit_Price int(10) default null,
        Package varchar(25) default null,
        Is_Discontinued varchar(10) default null,
        FOREIGN KEY (Supplier_ID) REFERENCES Supplier (Supplier_ID) ON DELETE CASCADE ON UPDATE CASCADE
		);
  
CREATE TABLE Customer(
		Customer_ID int(11) auto_increment primary KEY,
        First_Name varchar(25) default null,
        Last_Name varchar(25) default null,
        City varchar(25) default null,
        Country varchar(25) default null,
        Phone int(10) default null
		);
        
CREATE TABLE Orders(
		Order_ID int(11) auto_increment primary KEY,
        Order_Date date not null,
        Customer_ID int(11) default null,
        Total_Amount int(10) default null,
        FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID) ON DELETE CASCADE ON UPDATE CASCADE
		);

CREATE TABLE OrderItem(
		OrderItem_ID int(11) auto_increment primary KEY,
        Order_ID int(11) default null,
        Product_ID int(11) default null,
        Unit_Price int(10) default null,
        Quantity int(10) default null,
        FOREIGN KEY (Order_ID) REFERENCES Orders (Order_ID) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (Product_ID) REFERENCES Product (Product_ID) ON DELETE CASCADE ON UPDATE CASCADE
		);
 
 
        
INSERT INTO Customer(Customer_ID,First_Name,Last_Name,City,Country,Phone) VALUES(100,'Steven','King','Southlake','US',951753651);
INSERT INTO Customer(Customer_ID,First_Name,Last_Name,City,Country,Phone) VALUES(101,'Neena','Kochhar','San Francisco','US',917524845);
INSERT INTO Customer(Customer_ID,First_Name,Last_Name,City,Country,Phone) VALUES(102,'Lex','De Haan','Seattle','US',957524845);
INSERT INTO Customer(Customer_ID,First_Name,Last_Name,City,Country,Phone) VALUES(103,'Alexander','Hunold','San Francisco','US',951524845);
INSERT INTO Customer(Customer_ID,First_Name,Last_Name,City,Country,Phone) VALUES(104,'Bruce','Ernst','Toronto','CA',951724895);
INSERT INTO Customer(Customer_ID,First_Name,Last_Name,City,Country,Phone) VALUES(105,'David','Austin','London','UK',951754645);
INSERT INTO Customer(Customer_ID,First_Name,Last_Name,City,Country,Phone) VALUES(106,'Valli','Pataballa','Toronto','CA',951762845);
INSERT INTO Customer(Customer_ID,First_Name,Last_Name,City,Country,Phone) VALUES(107,'Diana','Lorentz','Seattle','US',951764445);
INSERT INTO Customer(Customer_ID,First_Name,Last_Name,City,Country,Phone) VALUES(108,'Nancy','Greenberg','San Francisco','US',951752425);
INSERT INTO Customer(Customer_ID,First_Name,Last_Name,City,Country,Phone) VALUES(109,'Daniel','Faviet','Seattle','US',751752484);
INSERT INTO Customer(Customer_ID,First_Name,Last_Name,City,Country,Phone) VALUES(110,'John','Chen','Toronto','CA',851752445);

INSERT INTO orders(Order_ID,Order_Date,Customer_Id,Total_Amount) VALUES('23081900','2019-08-23',100,3600);
INSERT INTO orders(Order_ID,Order_Date,Customer_Id,Total_Amount) VALUES('20021901','2019-02-23',101,7500);
INSERT INTO orders(Order_ID,Order_Date,Customer_Id,Total_Amount) VALUES('27061902','2019-06-27',102,8000);
INSERT INTO orders(Order_ID,Order_Date,Customer_Id,Total_Amount) VALUES('15081903','2019-08-15',103,1500);
INSERT INTO orders(Order_ID,Order_Date,Customer_Id,Total_Amount) VALUES('19031904','2019-03-19',104,5300);
INSERT INTO orders(Order_ID,Order_Date,Customer_Id,Total_Amount) VALUES('22031905','2019-03-22',105,4600);
INSERT INTO orders(Order_ID,Order_Date,Customer_Id,Total_Amount) VALUES('26121906','2019-08-23',106,9600);
INSERT INTO orders(Order_ID,Order_Date,Customer_Id,Total_Amount) VALUES('01101907','2019-10-01',107,8000);
INSERT INTO orders(Order_ID,Order_Date,Customer_Id,Total_Amount) VALUES('16121908','2019-08-23',108,3600);
INSERT INTO orders(Order_ID,Order_Date,Customer_Id,Total_Amount) VALUES('28091909','2019-09-28',109,1300);
INSERT INTO orders(Order_ID,Order_Date,Customer_Id,Total_Amount) VALUES('220519110','2019-05-22',110,9400);

INSERT INTO supplier(Supplier_ID,Company_Name,Contact_Name,City,Country,Phone,Fax) VALUES(1010,'Pattern iServe','Hugh Hickson','Lehi','US',0,0);
INSERT INTO supplier(Supplier_ID,Company_Name,Contact_Name,City,Country,Phone,Fax) VALUES(1020,'Zappos retail','Melissa Keippel','Las Vegas','US',0,0);
INSERT INTO supplier(Supplier_ID,Company_Name,Contact_Name,City,Country,Phone,Fax) VALUES(1030,'Asurion LLP','Barry Vandevier','Dulles','US',0,0);
INSERT INTO supplier(Supplier_ID,Company_Name,Contact_Name,City,Country,Phone,Fax) VALUES(1040,'Pharmapacks','Alexis Ramsook-Purpura','ISLANDIA','US',85579727,0);
INSERT INTO supplier(Supplier_ID,Company_Name,Contact_Name,City,Country,Phone,Fax) VALUES(1050,'Carlyle','NA','Melville','US',6928862,0);
INSERT INTO supplier(Supplier_ID,Company_Name,Contact_Name,City,Country,Phone,Fax) VALUES(1060,'Utopia Deals','NA','Plainview','US',254232821,0);
INSERT INTO supplier(Supplier_ID,Company_Name,Contact_Name,City,Country,Phone,Fax) VALUES(1070,'Orva Stores','NA','New York','US',212369571,0);
INSERT INTO supplier(Supplier_ID,Company_Name,Contact_Name,City,Country,Phone,Fax) VALUES(1080,'AnkerDirect','NA','California','US',0,0);
INSERT INTO supplier(Supplier_ID,Company_Name,Contact_Name,City,Country,Phone,Fax) VALUES(1090,'glenthebookseller','NA','Aurora','US',0,0);
INSERT INTO supplier(Supplier_ID,Company_Name,Contact_Name,City,Country,Phone,Fax) VALUES(1100,'Galactic Shop','NA','Dover','US',0,0);



ALTER TABLE product MODIFY COLUMN Product_Name VARCHAR (500) NOT NULL;

INSERT INTO product(Product_ID,Product_Name,Supplier_Id,Unit_Price,Package,Is_Discontinued) VALUES('501','IMAK Compression Pain Relief Mask',1010,'16.99',1,'No');
INSERT INTO product(Product_ID,Product_Name,Supplier_Id,Unit_Price,Package,Is_Discontinued) VALUES('502','Carhartt Men Knit Cuffed Beanie',1020,'19.99',1,'No');
INSERT INTO product(Product_ID,Product_Name,Supplier_Id,Unit_Price,Package,Is_Discontinued) VALUES('503','ASURION 4 Year Laptop Accident Protection Plan',1030,'199.99',1,'No');
INSERT INTO product(Product_ID,Product_Name,Supplier_Id,Unit_Price,Package,Is_Discontinued) VALUES('504','Vitron-C High Potency Iron Supplement',1040,'12.13',1,'No');
INSERT INTO product(Product_ID,Product_Name,Supplier_Id,Unit_Price,Package,Is_Discontinued) VALUES('505','Carlyle Melatonin 12 mg Fast Dissolve 180 Tablets',1050,'8.49',1,'No');
INSERT INTO product(Product_ID,Product_Name,Supplier_Id,Unit_Price,Package,Is_Discontinued) VALUES('506','Utopia Bedding Throw Pillows Insert',1060,'16.99',2,'No');
INSERT INTO product(Product_ID,Product_Name,Supplier_Id,Unit_Price,Package,Is_Discontinued) VALUES('507','ASICS Mens Gel-Venture 8',1070,'44.95',1,'No');
INSERT INTO product(Product_ID,Product_Name,Supplier_Id,Unit_Price,Package,Is_Discontinued) VALUES('508','Anker USB C to HDMI Adapter',1080,'17.99',1,'No');
INSERT INTO product(Product_ID,Product_Name,Supplier_Id,Unit_Price,Package,Is_Discontinued) VALUES('509','The Seven Husbands of Evelyn Hugo: A Novel',1090,'6.66',1,'No');
INSERT INTO product(Product_ID,Product_Name,Supplier_Id,Unit_Price,Package,Is_Discontinued) VALUES('510','Tony Packos Pickle & Pepper The Originals',1100,'25',2,'No');
INSERT INTO product(Product_ID,Product_Name,Supplier_Id,Unit_Price,Package,Is_Discontinued) VALUES('511','Gaia Herbs Black Elderberry Syrup',1010,'15.84',1,'No');
INSERT INTO product(Product_ID,Product_Name,Supplier_Id,Unit_Price,Package,Is_Discontinued) VALUES('512','HUE Womens Slouch Sock 3 Pair Pack',1020,'17.80',1,'No');
INSERT INTO product(Product_ID,Product_Name,Supplier_Id,Unit_Price,Package,Is_Discontinued) VALUES('513','Carhartt Deluxe Dual Compartment Insulated Lunch Cooler Bag',1020,'29.99',1,'No');
INSERT INTO product(Product_ID,Product_Name,Supplier_Id,Unit_Price,Package,Is_Discontinued) VALUES('514','ASURION 3 Year Electronics Protection Plan with Tech Support',1030,'33.99',1,'No');
INSERT INTO product(Product_ID,Product_Name,Supplier_Id,Unit_Price,Package,Is_Discontinued) VALUES('515','Old Spice Aluminum Free Deodorant for Men',1040,'17.19',3,'No');
INSERT INTO product(Product_ID,Product_Name,Supplier_Id,Unit_Price,Package,Is_Discontinued) VALUES('516','Cranberry Concentrate Extract ',1050,'9.99',1,'No');
INSERT INTO product(Product_ID,Product_Name,Supplier_Id,Unit_Price,Package,Is_Discontinued) VALUES('517','Utopia Bedding Throw Pillows Insert',1060,'24.99',4,'No');
INSERT INTO product(Product_ID,Product_Name,Supplier_Id,Unit_Price,Package,Is_Discontinued) VALUES('518','Skechers Women Meditation-Daisy Delight Flip-Flop',1070,'24.95',1,'No');
INSERT INTO product(Product_ID,Product_Name,Supplier_Id,Unit_Price,Package,Is_Discontinued) VALUES('519','Anker Soundcore Life Q20 Hybrid Active Noise Cancelling Headphones',1080,'59.99',1,'No');
INSERT INTO product(Product_ID,Product_Name,Supplier_Id,Unit_Price,Package,Is_Discontinued) VALUES('520','The Very Hungry Caterpillar',1090,'1.46',1,'No');



INSERT INTO orderitem(Orderitem_ID,Order_id,Product_Id,Unit_Price,Quantity) VALUES(9000,23081900,510,25,4);
INSERT INTO orderitem(Orderitem_ID,Order_id,Product_Id,Unit_Price,Quantity) VALUES(9001,20021901,507,44.95,6);
INSERT INTO orderitem(Orderitem_ID,Order_id,Product_Id,Unit_Price,Quantity) VALUES(9002,27061902,516,9.99,10);
INSERT INTO orderitem(Orderitem_ID,Order_id,Product_Id,Unit_Price,Quantity) VALUES(9003,15081903,503,199.99,1);
INSERT INTO orderitem(Orderitem_ID,Order_id,Product_Id,Unit_Price,Quantity) VALUES(9004,19031904,507,44.95,5);
INSERT INTO orderitem(Orderitem_ID,Order_id,Product_Id,Unit_Price,Quantity) VALUES(9005,22031905,509,6.66,12);
INSERT INTO orderitem(Orderitem_ID,Order_id,Product_Id,Unit_Price,Quantity) VALUES(9006,26121906,518,24.95,5);
INSERT INTO orderitem(Orderitem_ID,Order_id,Product_Id,Unit_Price,Quantity) VALUES(9007,01101907,504,12.13,8);
INSERT INTO orderitem(Orderitem_ID,Order_id,Product_Id,Unit_Price,Quantity) VALUES(9008,16121908,517,24.99,8);
INSERT INTO orderitem(Orderitem_ID,Order_id,Product_Id,Unit_Price,Quantity) VALUES(9009,28091909,511,15.84,6);
INSERT INTO orderitem(Orderitem_ID,Order_id,Product_Id,Unit_Price,Quantity) VALUES(9010,220519110,501,16.99,5);

UPDATE orders SET Total_Amount = 84.95 WHERE Customer_Id = 100;
UPDATE orders SET Total_Amount = 100 WHERE Customer_Id = 101;
UPDATE orders SET Total_Amount = 269.7 WHERE Customer_Id = 102;
UPDATE orders SET Total_Amount = 99.9 WHERE Customer_Id = 103;
UPDATE orders SET Total_Amount = 199.99 WHERE Customer_Id = 104;
UPDATE orders SET Total_Amount = 224.75 WHERE Customer_Id = 105;
UPDATE orders SET Total_Amount = 79.92 WHERE Customer_Id = 106;
UPDATE orders SET Total_Amount = 124.75 WHERE Customer_Id = 107;
UPDATE orders SET Total_Amount = 97.04 WHERE Customer_Id = 108;
UPDATE orders SET Total_Amount = 199.92 WHERE Customer_Id = 109;
UPDATE orders SET Total_Amount = 95.04 WHERE Customer_Id = 110;



SELECT * FROM orders;

SELECT * FROM customer;

SELECT * FROM orderitem;

SELECT * FROM product;

SELECT * FROM supplier;
