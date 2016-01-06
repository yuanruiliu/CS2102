CREATE TABLE user (
	id INT PRIMARY KEY,
	email VARCHAR(64) UNIQUE NOT NULL,
	password VARCHAR(16) NOT NULL,
	name VARCHAR(64) NOT NULL,
	authority VARCHAR(64) NOT NULL,
	CHECK (NOT password="")
);

CREATE TABLE restaurant (
	id INT PRIMARY KEY,
	name VARCHAR(256) NOT NULL,
	address VARCHAR(256) NOT NULL,
	category VARCHAR(256) NOT NULL,
	isApproved BOOLEAN NOT NULL,
	avg_price INT NOT NULL CHECK(avg_price > 0),
	area VARCHAR(256) NOT NULL,
	create_time DATE NOT NULL,
	owner INT REFERENCES user(id),
	UNIQUE(name,address)	
);

CREATE TABLE dish (
	id INT NOT NULL,
	name VARCHAR(128) NOT NULL,
	num_of_vote INT NOT NULL CHECK(num_of_vote > 0),
	price INT NOT NULL CHECK(price > 0),
	restaurant INT REFERENCES restaurant(id),
	PRIMARY KEY (restaurant, id)
);

CREATE TABLE time ( 
	time DATE PRIMARY KEY
);

CREATE TABLE evaluate (
	user_id INT REFERENCES user(id),
	restaurant_id INT REFERENCES restaurant(id),
	at_time DATE REFERENCES time(time),
	comment VARCHAR(1024),
	PRIMARY KEY (user_id, restaurant_id, at_time)
);

CREATE 
VIEW own_restaurant (u_name,r_name,r_address)
AS (
	SELECT u.name, r.name, r.address
        FROM user u, restaurant r
        WHERE r.owner = u.id
)