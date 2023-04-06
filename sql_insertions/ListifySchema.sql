CREATE TABLE IF NOT EXISTS Users (
	email VARCHAR(256) NOT NULL,
	username VARCHAR(64) UNIQUE NOT NULL,
	password VARCHAR(32) NOT NULL,
	join_date DATE NOT NULL,
	PRIMARY KEY(email)
);

CREATE TABLE IF NOT EXISTS Listings (
	listingid NUMERIC PRIMARY KEY,
	name VARCHAR(256) NOT NULL,
	item_condition_id VARCHAR(32) NOT NULL REFERENCES itemCondition(item_condition) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED,
	brand_name VARCHAR(32) NOT NULL DEFAULT 'None',
	price DECIMAL(10,2) NOT NULL,
	main_category VARCHAR(32) NOT NULL REFERENCES Categories(category) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED,
	date_posted DATE NOT NULL,
	seller VARCHAR(256) NOT NULL REFERENCES Users(email) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED,
	purchased VARCHAR(5) DEFAULT 'false',
	CONSTRAINT chk_item_condition CHECK(item_condition_id IN ('New','Preloved','Like New','Poor','Fair'),
	CONSTRAINT chk_main_category CHECK(main_category IN ('Home','Men','Women','Beauty','Electronics','Sports & Outdoors','Handmade','Others','Vintage & Collectibles','Kids'))
);

CREATE TABLE IF NOT EXISTS Transactions (
	transactionid NUMERIC PRIMARY KEY,
	buyer VARCHAR(256) NOT NULL REFERENCES Users(email) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED,
	seller VARCHAR(256) NOT NULL REFERENCES Users(email) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED,
	listing NUMERIC NOT NULL REFERENCES Listings(listingid) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED,
	transactiondate DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Categories (
	category VARCHAR(32) NOT NULL,
	description VARCHAR(256) NOT NULL,
	PRIMARY KEY (Category)
);

CREATE TABLE IF NOT EXISTS Admins (
	adminid NUMERIC PRIMARY KEY,
	email VARCHAR(256) UNIQUE NOT NULL,
	password VARCHAR(32) NOT NULL,
	join_date DATE NOT NULL,
	FOREIGN KEY (Email) REFERENCES Users(email) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED
);

CREATE TABLE IF NOT EXISTS itemCondition (
	item_condition VARCHAR(32) PRIMARY KEY
);