create database QuanLyTourDuLich;

use QuanLyTourDuLich;

create table Destination(
id int auto_increment primary key,
destinationName varchar(255) not null,
describes varchar(255) not null,
cost double not null,
city_id int not null,
foreign key (city_id) references City(id) 
);

INSERT INTO Destination (destinationName, describes, cost, city_id) VALUE('Vịnh Hạ Long','Tour du thuyền 5 sao cao cấp vịnh Hạ Long - 1 ngày',1000000,2);
INSERT INTO Destination (destinationName, describes, cost, city_id) VALUE('Đảo Nam Phú Quốc','Tour 4 đảo Nam Phú Quốc - 1 ngày',722900,3);
INSERT INTO Destination (destinationName, describes, cost, city_id) VALUE('Vịnh Nha Trang','Tour thuyền 5 sao Sea Coral ngắm hoàng hôn tại Vịnh Nha Trang - 1 ngày',1097500,1);
INSERT INTO Destination (destinationName, describes, cost, city_id) VALUE('Côn Đảo (Hòn Sơn)','Tour Côn Đảo 2 Ngày 1 Đêm - Du Lịch Tâm Linh (Đón/Trả Khách tại Sân Bay Côn Đảo)',2926569,4);
INSERT INTO Destination (destinationName, describes, cost, city_id) VALUE('Vịnh Hạ Long','Tour Trong Ngày | Khám Phá Vịnh Hạ Long Với We Go Halong Cruise từ Hà Nội hoặc Hạ Long',690022,2);
INSERT INTO Destination (destinationName, describes, cost, city_id) VALUE('Cố Đô Huế','Tour Một Ngày Thăm Quan Cố Đô Huế',993367,5);


create table Clients(
id int auto_increment primary key not null,
nameClient varchar(50) not null,
idNumber int not null,
dateBirth year not null,
city_id int not null,
foreign key (city_id) references City(id) 
);

INSERT INTO Clients (nameClient, idNumber, dateBirth, city_id) VALUE ('Nguyen Van A', 123456789, '1990', 1);
INSERT INTO Clients (nameClient, idNumber, dateBirth, city_id) VALUE ('Tran Thi B', 987654321, '1985', 2);
INSERT INTO Clients (nameClient, idNumber, dateBirth, city_id) VALUE ('Le Van C', 456789123, '1995', 3);
INSERT INTO Clients (nameClient, idNumber, dateBirth, city_id) VALUE ('Pham Thi D', 654321987, '1980', 4);
INSERT INTO Clients (nameClient, idNumber, dateBirth, city_id) VALUE ('Hoang Van E', 789123456, '2000', 5);
INSERT INTO Clients (nameClient, idNumber, dateBirth, city_id) VALUE ('Nguyen Thi F', 321987654, '1975', 1);
INSERT INTO Clients (nameClient, idNumber, dateBirth, city_id) VALUE ('Tran Van G', 963852741, '1992', 2);
INSERT INTO Clients (nameClient, idNumber, dateBirth, city_id) VALUE ('Le Thi H', 852741963, '1988', 3);
INSERT INTO Clients (nameClient, idNumber, dateBirth, city_id) VALUE ('Pham Van I', 741852963, '1997', 4);
INSERT INTO Clients (nameClient, idNumber, dateBirth, city_id) VALUE ('Hoang Thi K', 369258147, '1982', 5);


create table City(
id int auto_increment primary key,
cityName varchar(20) not null
);

INSERT INTO City (cityName) VALUES('Nha Trang'),('Hạ Long'),('Phú Quốc'),('Bà Rịa - Vũng Tàu'),('TP Huế');


create table Tour(
id int auto_increment primary key,
tourCode int not null,
category_id int not null,
destination_id int not null,
dateStart date not null,
dateEnd date not null,
foreign key(tourCode,category_id) references CategoryTour(categoryCode,id),
foreign key(destination_id) references Destination(id)
);

INSERT INTO Tour (tourCode, category_id, destination_id, dateStart, dateEnd) VALUE (11, 1, 1, '2020-05-01', '2020-05-07');
INSERT INTO Tour (tourCode, category_id, destination_id, dateStart, dateEnd) VALUE (11, 1, 2, '2020-06-10', '2020-06-15');
INSERT INTO Tour (tourCode, category_id, destination_id, dateStart, dateEnd) VALUE (11, 1, 3, '2020-07-20', '2020-07-25');
INSERT INTO Tour (tourCode, category_id, destination_id, dateStart, dateEnd) VALUE (22, 2, 4, '2020-08-05', '2020-08-12');
INSERT INTO Tour (tourCode, category_id, destination_id, dateStart, dateEnd) VALUE (22, 2, 5, '2020-09-15', '2020-09-20');
INSERT INTO Tour (tourCode, category_id, destination_id, dateStart, dateEnd) VALUE (11, 1, 1, '2020-10-10', '2020-10-17');
INSERT INTO Tour (tourCode, category_id, destination_id, dateStart, dateEnd) VALUE (11, 1, 2, '2020-11-05', '2020-11-10');
INSERT INTO Tour (tourCode, category_id, destination_id, dateStart, dateEnd) VALUE (11, 1, 3, '2020-12-20', '2020-12-27');
INSERT INTO Tour (tourCode, category_id, destination_id, dateStart, dateEnd) VALUE (22, 2, 4, '2020-01-15', '2020-01-20');
INSERT INTO Tour (tourCode, category_id, destination_id, dateStart, dateEnd) VALUE (22, 2, 6, '2020-02-10', '2020-02-15');
INSERT INTO Tour (tourCode, category_id, destination_id, dateStart, dateEnd) VALUE (11, 1, 1, '2020-03-10', '2020-03-17');
INSERT INTO Tour (tourCode, category_id, destination_id, dateStart, dateEnd) VALUE (11, 1, 2, '2020-04-05', '2020-04-10');
INSERT INTO Tour (tourCode, category_id, destination_id, dateStart, dateEnd) VALUE (11, 1, 3, '2020-05-20', '2020-05-25');
INSERT INTO Tour (tourCode, category_id, destination_id, dateStart, dateEnd) VALUE (22, 2, 6, '2020-06-05', '2020-06-12');
INSERT INTO Tour (tourCode, category_id, destination_id, dateStart, dateEnd) VALUE (22, 2, 5, '2020-07-15', '2020-07-20');


create table CategoryTour(
id int auto_increment primary key,
categoryCode int not null,
categoryName varchar(50) not null
); 
ALTER TABLE CategoryTour ADD INDEX idx_category_code_id (categoryCode, id);

INSERT INTO CategoryTour (categoryCode, categoryName) VALUE(11,'Tour Tham Quan');
INSERT INTO CategoryTour (categoryCode, categoryName) VALUE(22,'Tour Thiên Nhiên');


create table OrderTour(
id int auto_increment primary key,
tour_id int not null,
client_id int not null,
statuss boolean not null,
foreign key(tour_id) references Tour(id),
foreign key(client_id) references Clients(id)
);

INSERT INTO OrderTour (tour_id, client_id, statuss) VALUE (1, 1, true);
INSERT INTO OrderTour (tour_id, client_id, statuss) VALUE (3, 2, true);
INSERT INTO OrderTour (tour_id, client_id, statuss) VALUE (5, 3, false);
INSERT INTO OrderTour (tour_id, client_id, statuss) VALUE (7, 4, true);
INSERT INTO OrderTour (tour_id, client_id, statuss) VALUE (9, 5, false);
INSERT INTO OrderTour (tour_id, client_id, statuss) VALUE (11, 6, true);
INSERT INTO OrderTour (tour_id, client_id, statuss) VALUE (4, 7, false);
INSERT INTO OrderTour (tour_id, client_id, statuss) VALUE (8, 8, true);
INSERT INTO OrderTour (tour_id, client_id, statuss) VALUE (9, 9, false);
INSERT INTO OrderTour (tour_id, client_id, statuss) VALUE (14, 10, true);

select * from city;
select * from categorytour;
select * from destination;
select * from clients;
select * from tour;
select * from ordertour;

select c.cityname as "Thành Phố", count(t.id) as "Số lượng Tour" from tour t
	inner join destination d on t.destination_id=d.id
    inner join city c on d.city_id=c.id group by c.cityname;

select count(id) as "Số tour có ngày bắt đầu trong tháng 3 năm 2020" from tour where datestart between '2020-03-01' and '2020-03-31';

select count(id) as "Số tour có ngày kết thúc trong tháng 4 năm 2020" from tour where dateend between '2020-04-01' and '2020-04-30';
