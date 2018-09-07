INSERT INTO `ecomm_db`.`users` (`first_name`, `last_name`, `email`, `password`) 
VALUES ('test1', 'user1', 'test1@user1.com', '123456'),
	   ('test2', 'user2', 'test2@user2.com', '123456'),
	   ('test3', 'user3', 'test3@user3.com', '123456'),
	   ('test4', 'user4', 'test4@user4.com', '123456');

INSERT INTO payment_info (user_id, card_type, card_no, security_code, card_expiry_month, card_expiry_year)
VALUES (1, "Visa", 1234567890123456, 010, 08, 2020),
	   (2, "Master", 1234567890123456, 010, 08, 2020),
	   (3, "American Express", 1234567890123456, 010, 08, 2020),
	   (4, "Capital One", 1234567890123456, 010, 08, 2020);	

INSERT INTO categories (category_name)
VALUES ("Women's Clothing"),
	   ("Men's Clothing"),
	   ("Girls Clothing"),
	   ("Boys Clothing");

INSERT INTO items (item_name, item_image, item_quantity, item_color, item_size, item_cost)
VALUES ("shirt", "https://carwad.net/sites/default/files/shirt-pictures-114651-8778079.jpg", 1, "orange", 32, "$25.00"),
	   ("dress", "https://buyeyepothesis.com/wp-content/uploads/2018/05/Fancy-Party-Dresses-For-Women-32-About-Style-new-fashion-trends-with-Party-Dresses-For-Women.jpg", 1, "blue", 28, "$30.00"),
	   ("short", "http://www.dwp-dwp.com/images/1344/136406219-billabong-all-day-cargo-boys.jpg", 1, "blue", 14, "$12.99"),
	   ("skirt", "https://vignette.wikia.nocookie.net/americangirl/images/0/0b/BirthdayGirlSkirt_girls.jpg/revision/latest?cb=20100122064759", 1, "purple", 10, "$11.99");
	     

INSERT INTO user_address (user_id, address_line1, city, state, country, postal_code, shipping_address, billing_address)
VALUES (1, "160 Spear St", "San Francisco", "California", "United States", "94104", 0, 0),
	   (2, "200 Market St", "San Francisco", "California", "United States", "94104", 0, 0),
	   (3, "1st Street", "Reno", "Nevada", "United States", "89509", 0, 0),
	   (4, "South Virginia St", "Reno", "Nevada", "United States", "89521", 0, 0);