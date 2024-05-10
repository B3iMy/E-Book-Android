create database BookStore;
use BookStore;

create table product(
	productID int PRIMARY KEY auto_increment,
    productName nvarchar(50),
    Descript nvarchar(100),
    author nvarchar(50),
    publisher nvarchar(50)
);

create table custommer(
	custommerID int PRIMARY KEY auto_increment,
    custommerName nvarchar(50),
    email nvarchar(100),
    pass varchar(50),
    phonenumb int
    
);
alter table custommer modify column phonenumb varchar(30);
create table donhang(
	orderID int PRIMARY KEY auto_increment,
	productID int ,
    custommerID int ,
    createDate date,
    FOREIGN KEY (productID) REFERENCES product(productID),
	FOREIGN KEY (custommerID) REFERENCES custommer(custommerID)
);

CREATE TABLE productImage (
    imageID INT PRIMARY KEY AUTO_INCREMENT,
    productID INT,
    imageName VARCHAR(100),
    imageType VARCHAR(50),
    imageData LONGBLOB,
    FOREIGN KEY (productID) REFERENCES product(productID)
);
create table category(
	categoryID int PRIMARY KEY auto_increment,
    productID int ,
    categoryname nvarchar(50),
    FOREIGN KEY (productID) REFERENCES product(productID)
);
alter table product add column categoryID int ;
alter table product add constraint fk_categoryID foreign key (categoryID) references category(categoryID);
alter table product add column price Double;
show create table category;
alter table category drop foreign key category_ibfk_1;
alter table category drop column productID;
SELECT product.productID,product.categoryID, product.productName, product.Descript, product.author, product.publisher,categoryname, product.price
				FROM product
        		 JOIN category ON product.categoryID = category.categoryID
