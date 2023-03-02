create database if not exists homework_4_1;
use homework_4_1;

drop table if exists cats;
drop table if exists shops;

CREATE TABLE `shops` (
	`id` INT,
    `shopname` VARCHAR (100),
    PRIMARY KEY (id)
);
CREATE TABLE `cats` (
	`name` VARCHAR (100),
    `id` INT,
    PRIMARY KEY (id),
    shops_id INT,
    CONSTRAINT fk_cats_shops_id FOREIGN KEY (shops_id)
        REFERENCES `shops` (id)
);

INSERT INTO `shops`
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");

INSERT INTO `cats`
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);

-- Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)
select c.name, sh.shop_name
from cats as c
         left join shops sh on sh.id = c.shops_id;

-- Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)
-- 1
select shop_name
from shops as sh
         join cats on sh.id = cats.shops_id
where cats.name = 'Murzik';

-- 2
select sh.shop_name
from shops as sh
where id = (select cats.shops_id from cats where name = 'Murzik');


-- Вывести магазины, в котором НЕ продаются коты “Мурзик” и “Zuza”
select shop_name,
       name
from shops
         left join cats on cats.shops_id = shops.id
where name != 'Murzik'
  and name != 'Zuza';