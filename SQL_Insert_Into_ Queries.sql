INSERT INTO StateFees( State_Abbreviation, State_Name, salestax_percentage, shipping) 
VALUES 
('AL', 'Alabama', 0, 6 ),
('AK', 'Alaska', 0, 8 ),
('AZ', 'Arizona', 0, 6 ),
('AR', 'Arkansas', 0, 6 ),
('CA', 'California', .0825, 6 ),
('CO', 'Colorado', 0, 6 ),
('CT', 'Connecticut', 0, 6 ),
('DE', 'Delaware', 0, 6 ),
('FL', 'Florida', 0, 6 ),
('GA', 'Georgia', 0, 6  ),
('HI', 'Hawaii', 0, 8 ),
('ID', 'Idaho', 0, 6 ),
('IL', 'Illinois', 0, 6 ),
('IN', 'Indiana', 0, 6 ),
('IA', 'Iowa', 0, 6 ),
('KS', 'Kansas', 0, 6  ),
('KY', 'Kentucky', 0, 6  ),
('LA', 'Louisiana', 0, 4  ),
('ME', 'Maine', 0, 6 ),
('MD', 'Maryland', 0, 6  ),
('MA', 'Massachusetts', 0, 6  ),
('MI', 'Michigan', 0, 6 ),
('MN', 'Minnesota', 0, 6  ),
('MS', 'Mississippi', 0, 6  ),
('MO', 'Missouri', 0, 6),
('MT', 'Montana', 0, 6 ),
('NE', 'Nebraska', 0, 6  ),
('NV', 'Nevada', 0, 6),
('NH', 'New Hampshire', 0, 6  ),
('NJ', 'New Jersey', 0, 6 ),
('NM', 'New Mexico', 0, 4  ),
('NY', 'New York', 0, 6  ),
('NC', 'North Carolina', 0,  6 ),
('ND', 'North Dakota', 0,  6 ),
('OH', 'Ohio', 0, 6 ),
('OK', 'Oklahoma', 0, 4 ),
('OR', 'Oregon', 0, 6 ),
('PA', 'Pennsylvania', 0, 6 ),
('RI', 'Rhode Island', 0, 6 ),
('SC', 'South Carolina', 0, 6 ),
('SD', 'South Dakota', 0, 6 ),
('TN', 'Tennessee', 0, 6 ),
('TX', 'Texas', .0625, 4 ),
('UT', 'Utah', 0, 6 ),
('VT', 'Vermont', 0, 6  ),
('VA', 'Virginia', 0, 6  ),
('WA', 'Washington', 0, 6  ),
('WV', 'West Virginia', 0, 6  ),
('WI', 'Wisconsin', 0, 6 ),
('WY', 'Wyoming', 0, 6 );

INSERT INTO Customer( first_name, last_name, Phone, Email) 
VALUES 
('John', 'Doe','281-851-1111','John.Doe@gmail.com' ),
( 'Jane', 'Smith','281-851-2222',null),
( 'Bob', 'Johnson','281-851-3333','Bob.Johnson@gmail.com');

INSERT INTO Supplier_PersonalInfo(firstName, lastname)
VALUES 
('Jeff', 'Doe'),
('Kumquat', 'Smith'),
('quatKum', 'Johnson');

INSERT INTO Supplier_Information( SupplierID, Company_Name, Phone_Number, Phone_Type, Active)
VALUES 
(1, 'Lumber Inc.', 'MainPhone', '555-1234',1),
(1, 'Lumber Inc.', 'SalesPhone', '555-7777',0),
(2, 'Wood Inc.', 'ShippingPhone', '555-5678',1),
(3, 'Nails Inc.', 'MainPhone', '555-9898',1);


INSERT INTO Dog_House_Catalog(Description, Width, Length, Height, Quanity_on_hand, unit_price)
VALUES 
('Small Dog House', '20in', '26in', '28in', 100, 41.99),
('Medium Dog House', '24in', '30in', '32in', 50, 52.99),
('Large Dog House','28in','32in','38in', 25, 63.99);


INSERT INTO Raw_Material(SupplierID, Material_Name, Description, Measurements, Quanity_On_Hand)
VALUES 
( 2,'4x4 Yellowpine Lumber', 'Wood', '4in x 4in x 8ft', 100),
( 2,'4ftx8ft', 'Wood', '4ft x 8ft x 8ft', 50),
( 2,'2x4 Yellowpine Stud', 'Wood', '2in x 4in x 8ft', 25),
( 3,'4 inch screws(625 per box)', 'Nails', '4in', 25);

INSERT INTO Orders( CustomerID, StateID, order_date, delivery_address,is_active, payment_method)
VALUES 

( 1, 1, '04-12-21', '1912 Street, Kileen TX; 76548',0,  'Card'),
( 2, 2, '04-22-21', '1512 Street, Kileen TX; 76548',1, 'Cash' ),
( 3, 3, '04-23-21', '1318 Street, Kileen TX; 76548',1,'Check'),
( 1, 1, '04-24-21', '1912 Street, Kileen TX; 76548',1,  'Card');

INSERT INTO OrderDetail
VALUES 
( 5, 'Item1', 1, 1);
( 1, 'Item1', 1, 1),
( 1, 'Item2', 2, 1),
( 1, 'Item3', 3, 1),
( 2, 'Item1', 2, 1),
( 3, 'Item1', 1, 1),
( 3, 'Item2', 3, 1),
( 4, 'Item1', 2, 1);
