/* Queries */

/* 1: Show all cars that are available for rent at the moment */

SELECT * FROM `cars` WHERE available = 1 

manufacturerID	model				available
AH0707 	5 		Lorem5 				1
AH7474 	1 		Mercedes A Class 	1
AJ1814 	2 		VW Golf 8 			1
ZA2470 	4 		Ferrari 488 		1

/* 2: Show a list of all customers and their reservations, regardless of whether they have reservations right now*/

SELECT customers.lastName, customers.firstName, reservation.licensePlate, reservation.date_from, reservation.date_to 
FROM customers 
LEFT JOIN reservation ON customers.ID = reservation.customerID 

lastName	firstName	licensePlate	date_from	date_to 	
Müller 		Beate 		AH7474 			2019-11-01 	9999-01-01
Flunger 	Robert 		AH0707 			2019-10-20 	2019-10-25
Flunger 	Robert 		AJ1814 			2019-09-20 	2019-09-29
Ipsum 		Lorem 		ZA2470 			2018-10-10 	9999-01-01
Doe 		John 		AH0707 			2019-11-05 	2019-11-08
Herbert 	Wolfang 	NULL 			NULL 		NULL 

/* 3: Show customers who have not paid their invoice yet. */

SELECT customers.lastName, customers.firstName, reservation.ID, invoice.invoice_date, invoice.totalCost 
FROM customers 
INNER JOIN reservation ON customers.ID = reservation.customerID 
INNER JOIN invoice ON reservation.ID = invoice.reservationID 
WHERE invoice.chargesPaid = 0 

lastName 	firstName 	ID 		invoice_date 	totalCost 	
Doe 		John 		5 		2019-11-01 		420.20

/* 4: Show all cars the company bought from 2018 onwards*/

SELECT cars.licensePlate, cars.model, cars_condition.boughtOn 
FROM cars 
INNER JOIN cars_condition ON cars.licensePlate = cars_condition.licensePlate 
WHERE cars_condition.boughtOn >= "2018-01-01" 

licensePlate	model			boughtOn 	
ZA2470 			Ferrari 488 	2018-01-04
AH0707 			Lorem5 			2019-10-10

/* 5: Show all cars the company has with their license plate nr, manufacturer, contact person and their phone number*/

SELECT cars.licensePlate, cars.model, manufacturer.name, manufacturer_contact.contactPerson, manufacturer_contact.phone 
FROM cars 
LEFT JOIN manufacturer ON cars.manufacturerID = manufacturer.ID 
LEFT JOIN manufacturer_contact ON manufacturer.contactID = manufacturer_contact.ID 

licensePlate	model				name		contactPerson 	
AH0707 			Lorem5 				LoremIpsum 	Heinz Heinzl
AH7474 			Mercedes A Class 	Mercedes 	Hermann Maier
AJ1814 			VW Golf 8 			Volkswagen 	Matthias Müller
JQ2072 			Opel Astra 			Opel 		Matt Miller
ZA2470 			Ferrari 488 		Ferrari 	Maria Marianne

/* 6: Show reserved cars with a start location in the 15th district of Vienna*/

SELECT reservation.licensePlate, locations.name, locations.address 
FROM reservation 
INNER JOIN locations ON reservation.locationID = locations.ID
WHERE locations.address LIKE "%1150%"

licensePlate 	name 		address 	
ZA2470 			Parkplatz 	Schweglerstraße 10, 1150 Wien

/* 7: Show all customers who got additional charges */

SELECT customers.lastName, customers.firstName, reservation.licensePlate, additionalcharges.chargeAmount, additionalcharges.reason 
FROM customers 
INNER JOIN reservation ON customers.ID = reservation.customerID 
INNER JOIN invoice ON reservation.ID = invoice.reservationID 
INNER JOIN car_return ON invoice.ID = car_return.invoiceID 
INNER JOIN additionalcharges ON car_return.ID = additionalcharges.returnID 

lastName	firstName	licensePlate	chargeAmount	reason 	
Flunger 	Robert 		AJ1814 			100.60 			returned too late
Doe 		John 		AH0707 			1000.00 		car returned damaged


