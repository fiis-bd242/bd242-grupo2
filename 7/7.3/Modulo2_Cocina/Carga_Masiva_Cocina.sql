INSERT INTO CATEGORIA (cod_categoria, nombre_categoria) VALUES 
('AP', 'Appetizers'),
('PA', 'Pastas'),
('SA', 'Salads'),
('CS', 'Chicken & Seafood'),
('PO', 'Postres'),
('BS', 'Burgers & Sandwiches'),
('BE', 'Bebidas'),
('CO', 'Cocktails');

INSERT INTO AREA_EC (cod_area_ec, descripcion_ec) VALUES 
('EF', 'Estación Freidor'),
('EM', 'Estación Mesero'),
('EB', 'Estación Bar'),
('EP', 'Estación Platonacho'),
('ES', 'Estación Sartén'),
('EA', 'Estación Parrilla');

-- Appetizers
INSERT INTO Producto_Friday (Cod_prodFriday, Nombre_producto, Precio_producto, Descripcion, cod_categoria, cod_area_ec)
VALUES 
('APP1000001', 'Fried Mozzarella', 37.00, 'Palitos de mozzarella empanizados y fritos, servidos con salsa marinara', 'AP', 'EF'),
('APP1000002', 'Chips and Salsa', 22.00, 'Crujientes chips de tortilla de maiz', 'AP', 'EF'),
('APP1000003', 'Boneless Wings', 40.00, 'Tiernos cortes de pecuchas de pollo empanizados', 'AP', 'EF'),
('APP1000004', 'Loaded Potato Skins', 36.00, 'Cáscaras de papa con queso derretido, tocino y crema agria', 'AP', 'EF');

-- Pastas
INSERT INTO Producto_Friday (Cod_prodFriday, Nombre_producto, Precio_producto, Descripcion, cod_categoria, cod_area_ec)
VALUES 
('PAS1000001', 'Fried Chicken Pasta', 40.00, 'Crocantes tiritas de pecucha de pollo empanizadas con cajún', 'PA', 'ES'),
('PAS1000002', 'Brushetas Pasta Platter', 40.00, 'Pasta ensalada de tomate', 'PA', 'ES'),
('PAS1000003', 'Cajun Shrimp and Pasta', 42.00, 'Langostinos de tiritas d pecucha de pollo', 'PA', 'ES'),
('PAS1000004', 'Bufalo Chicken Pasta', 40.00, 'Combinación de tres aperitivos favoritos en un solo plato', 'PA', 'ES');

-- Salads
INSERT INTO Producto_Friday (Cod_prodFriday, Nombre_producto, Precio_producto, Descripcion, cod_categoria, cod_area_ec)
VALUES 
('SAL1000001', 'Caesar Salad', 28.00, 'Ensalada clásica César con lechuga romana, parmesano y crutones', 'SA', 'EP'),
('SAL1000002', 'House Salad', 35.00, 'Ensalada de la casa con lechuga mixta, tomate, zanahoria y aderezo a elección', 'SA', 'EP'),
('SAL1000003', 'Cobb Salad', 40.00, 'Pollo a la parrilla sazonada con especiales cajun', 'SA', 'EP'),
('SAL1000004', 'Chipote Yucatan', 39.00, 'Pollo asado desmenuzado sobre una base de lechugas y palta', 'SA', 'EP');

-- Chicken & Seafood
INSERT INTO Producto_Friday (Cod_prodFriday, Nombre_producto, Precio_producto, Descripcion, cod_categoria, cod_area_ec)
VALUES 
('CSF1000001', 'Fried Shrimp', 35.00, 'Camarones empanizados y fritos servidos con salsa de cóctel', 'CS', 'EF'),
('CSF1000002', 'Grilled Chicken', 30.00, 'Pollo a la parrilla sazonado con especias, servido con vegetales', 'CS', 'EF'),
('CSF1000003', 'Fridays Shrimp', 48.00, 'Langostinos empanizados y dorados a la perfeccion', 'CS', 'EF'),
('CSF1000004', 'Sesame Chicken Strips', 40.00, 'Tiritas de pollo empanizadas en pan japonés, en salsa glaze fridays', 'CS','EF');

-- Postres
INSERT INTO Producto_Friday (Cod_prodFriday, Nombre_producto, Precio_producto, Descripcion, cod_categoria, cod_area_ec)
VALUES 
('POS1000001', 'Brownie Obsession', 27.00, 'Brownie caliente con helado de vainilla, chocolate y caramelo', 'PO', 'EP'),
('POS1000002', 'Double Berry Jack', 25.00, 'Deliciosa tarta de manzana', 'PO', 'EP'),
('POS1000003', 'Churro Brownie', 27.00, 'Crujientes churros cubiertos con canela', 'PO', 'EP'),
('POS1000004', 'Cheesecake', 28.00, 'Clásico pastel de queso con cobertura de fresas', 'PO', 'EP');

-- Burgers & Sandwiches
INSERT INTO Producto_Friday (Cod_prodFriday, Nombre_producto, Precio_producto, Descripcion, cod_categoria, cod_area_ec)
VALUES 
('BS10000001', 'Fridays Signature Burger', 36.00, 'Hamburguesa con el sello único de Fridays y guarniciones frescas', 'BS', 'EA'),
('BS10000002', 'BBQ Chicken Sandwich', 32.00, 'Sándwich de pollo a la parrilla con salsa BBQ y queso derretido', 'BS', 'EA'),
('BS10000003', 'Bacon Cheeseburger', 38.00, 'Hamburguesa de 200gr, gratinada con queso Cheddar y cubierta con dos tiras de tocino','BS','EA'),
('BS10000004', 'Texas Chili', 39.00, 'Hamburguesa cubierta con el delicioso chili meat','BS','EA');

-- Bebidas
INSERT INTO Producto_Friday (Cod_prodFriday, Nombre_producto, Precio_producto, Descripcion, cod_categoria, cod_area_ec)
VALUES 
('BEV1000001', 'Lemonade', 10.00, 'Limonada fresca servida con hielo', 'BE', 'EB'),
('BEV1000002', 'Arnold Palmer', 14.00, 'Te negro, jugo de lima y limón', 'BE', 'EB'),
('BEV1000003', 'Green Apple Slush', 15.00, 'Jarabe de manzana', 'BE', 'EB'),
('BEV1000004', 'Iced Tea', 9.00, 'Té helado con un toque de limón', 'BE', 'EB');

-- Cocktails
INSERT INTO Producto_Friday (Cod_prodFriday, Nombre_producto, Precio_producto, Descripcion, cod_categoria, cod_area_ec)
VALUES 
('COC1000001', 'Margarita', 18.00, 'Margarita clásica servida en las rocas con sal', 'CO', 'EB'),
('COC1000002', 'Cosmo Rita Shaker', 30.00, 'Tequila Jose Cuervo', 'CO', 'EB'),
('COC1000003', 'Blackberry Mojito', 26.00, 'Jarabe de guayaba', 'CO', 'EB'),
('COC1000004', 'Long Island Iced Tea', 20.00, 'Cóctel con mezcla de licores y un toque de cola', 'CO', 'EB');

INSERT INTO TAMANO (cod_tamano, descripcion_tamano) VALUES 
('PE', 'Pequeño'),
('ME', 'Mediano');
INSERT INTO TIPO_DE_MESA (cod_tipo_de_mesa, descripcion_tipo_mesa) VALUES 
('BA', 'Bar'),
('NR', 'No bar');

INSERT INTO ESTADO_DP (cod_estado_dp, descripcion_estado_dp) VALUES 
('RE','REGISTRANDO'),
('TP', 'TEMPRANO'), -- Cambio GitHub
('MO', 'MODERADO'),
('TA', 'TARDANZA'),
('TD', 'TERMINADO');

INSERT INTO ESTADO_ITEM_DP (cod_estado_item_dp, descripcion_estado_item_dp) VALUES 
('FI', 'FINALIZADO'), -- Cambio GitHub
('EP', 'EN ESPERA');


INSERT INTO MESA (cod_mesa, cod_tipo_de_mesa, cod_tamano) VALUES 
('10', 'NR', 'PE'),
('20', 'NR', 'ME'),
('30', 'NR', 'PE'),
('40', 'NR', 'ME'),
('50', 'NR', 'PE'),
('60', 'NR', 'ME'),
('70', 'NR', 'PE'),
('80', 'NR', 'ME'),
('90', 'NR', 'ME'),
('100', 'BA', 'PE'),
('101', 'BA', 'PE'),
('102', 'BA', 'PE'),
('103', 'BA', 'PE'),
('104', 'BA', 'PE');


INSERT INTO IDENTIFICACION_MESERO (Codigo_empleado) VALUES 
(53),
(53),
(53),
(54),
(66),
(53),
(61),
(61),
(53),
(61),
(61),
(66),
(71),
(90),
(53),
(98),
(53),
(53),
(61),
(98),
(66),
(71),
(66),
(71),
(90),
(53),
(98),
(66),
(53),
(61),
(61),
(66),
(71),
(90),
(53),
(98),
(53),
(53),
(61),
(98),
(66),
(71),
(98);


INSERT INTO DETALLE_PEDIDO (cod_dp, cod_estado_dp,
									cod_im, cod_mesa) VALUES 
('DP1','TD', 1, '50'),
('DP2','TD', 2, '40'),
('DP3','TD', 3, '30'),
('DP4','TD', 4, '10'),
('DP5','TD', 5, '50'),
('DP6','TD', 6, '104'),
('DP7','TD', 7, '40'),
('DP8','TD', 8, '102'),
('DP9','TD', 9, '101'),
('DP10','TD', 10, '100'),
('DP11','TD', 11, '50'),
('DP12','TD', 12, '40'),
('DP13','TD', 13, '30'),
('DP14','TD', 14, '50'),
('DP15','TD', 15, '10'),
('DP16','TD', 16, '30'),
('DP17','TD', 17, '50'),
('DP18','TP', 18, '10'),
('DP19','MO', 19, '20'),
('DP20','TA', 20, '40'),
('DP21','TD', 21, '70'),
('DP22','RE', 22, '50'),
('DP23','TP', 23, '90'),
('DP24','TA', 24, '100'),
('DP25','TP', 25, '101'),
('DP26','TA', 26, '104');



INSERT INTO ITEM_DETALLE_PEDIDO (cod_item_dp, Cod_prodFriday, cantidad, precio, cod_estado_item_dp, cod_dp) VALUES 
('IDP1', 'CSF1000003', 1, 40.00, 'EP', 'DP1'),
('IDP2', 'BS10000003', 1, 38.00, 'EP', 'DP1'),
('IDP3', 'BS10000003', 2, 76.00, 'EP', 'DP2'),
('IDP4', 'APP1000001', 1, 37.00, 'EP', 'DP1'),
('IDP5', 'APP1000002', 2, 44.00, 'EP', 'DP1'),
('IDP6', 'APP1000003', 3, 120.00, 'EP', 'DP2'),
('IDP7', 'APP1000004', 1, 36.00, 'EP', 'DP2'),
('IDP8', 'PAS1000001', 2, 80.00, 'EP', 'DP3'),
('IDP9', 'PAS1000002', 1, 40.00, 'EP', 'DP3'),
('IDP10', 'PAS1000003', 3, 126.00, 'EP', 'DP4'),
('IDP11', 'PAS1000004', 1, 40.00, 'EP', 'DP4'),
('IDP12', 'SAL1000001', 2, 56.00, 'EP', 'DP5'),
('IDP13', 'SAL1000002', 1, 35.00, 'EP', 'DP5'),
('IDP14', 'SAL1000003', 1, 40.00, 'EP', 'DP6'),
('IDP15', 'SAL1000004', 3, 117.00, 'EP', 'DP6'),
('IDP16', 'CSF1000001', 1, 35.00, 'EP', 'DP7'),
('IDP17', 'CSF1000002', 2, 60.00, 'EP', 'DP7'),
('IDP18', 'CSF1000003', 2, 96.00, 'EP', 'DP8'),
('IDP19', 'CSF1000004', 3, 120.00, 'EP', 'DP8'),
('IDP20', 'POS1000001', 1, 27.00, 'EP', 'DP9'),
('IDP21', 'POS1000002', 2, 50.00, 'EP', 'DP9'),
('IDP22', 'POS1000003', 1, 27.00, 'EP', 'DP10'),
('IDP23', 'POS1000004', 1, 28.00, 'EP', 'DP10'),
('IDP24', 'BS10000001', 2, 72.00, 'EP', 'DP11'),
('IDP25', 'BS10000002', 1, 32.00, 'EP', 'DP11'),
('IDP26', 'BS10000003', 3, 114.00, 'EP', 'DP12'),
('IDP27', 'BS10000004', 2, 78.00, 'EP', 'DP12'),
('IDP28', 'BEV1000001', 2, 20.00, 'EP', 'DP13'),
('IDP29', 'BEV1000002', 1, 14.00, 'EP', 'DP13'),
('IDP30', 'BEV1000003', 3, 45.00, 'EP', 'DP14'),
('IDP31', 'BEV1000004', 2, 18.00, 'EP', 'DP14'),
('IDP32', 'COC1000001', 2, 36.00, 'EP', 'DP15'),
('IDP33', 'COC1000002', 1, 30.00, 'EP', 'DP15'),
('IDP34', 'COC1000003', 3, 78.00, 'EP', 'DP16'),
('IDP35', 'COC1000004', 2, 40.00, 'EP', 'DP16'),
('IDP36', 'APP1000001', 2, 74.00, 'EP', 'DP17'),
('IDP37', 'APP1000002', 1, 22.00, 'EP', 'DP17'),
('IDP38', 'APP1000003', 3, 120.00, 'EP', 'DP18'),
('IDP39', 'APP1000004', 2, 72.00, 'EP', 'DP18'),
('IDP40', 'PAS1000001', 1, 40.00, 'EP', 'DP19'),
('IDP41', 'PAS1000002', 3, 120.00, 'EP', 'DP19'),
('IDP42', 'PAS1000003', 1, 42.00, 'EP', 'DP20'),
('IDP43', 'PAS1000004', 2, 80.00, 'EP', 'DP20'),
('IDP44', 'SAL1000001', 2, 56.00, 'EP', 'DP21'),
('IDP45', 'SAL1000002', 1, 35.00, 'EP', 'DP21'),
('IDP46', 'SAL1000003', 3, 120.00, 'EP', 'DP22'),
('IDP47', 'SAL1000004', 1, 39.00, 'EP', 'DP22'),
('IDP48', 'CSF1000001', 3, 105.00, 'EP', 'DP23'),
('IDP49', 'CSF1000002', 2, 60.00, 'EP', 'DP23'),
('IDP50', 'CSF1000003', 2, 96.00, 'EP', 'DP24');


INSERT INTO KDS (cod_kds, cod_area_ec, cod_item_dp) VALUES 
('KDS000EF', 'EF', 'IDP1'),  
('KDS000EF', 'EF', 'IDP2'),  
('KDS000EF', 'EF', 'IDP3'),  
('KDS000EF', 'EF', 'IDP4'),  
('KDS000EF', 'EF', 'IDP5'),  
('KDS000EF', 'EF', 'IDP6'),  
('KDS000EF', 'EF', 'IDP7'),  
('KDS000ES', 'ES', 'IDP8'),  
('KDS000ES', 'ES', 'IDP9'),  
('KDS000ES', 'ES', 'IDP10'), 
('KDS000ES', 'ES', 'IDP11'), 
('KDS000EP', 'EP', 'IDP12'), 
('KDS000EP', 'EP', 'IDP13'), 
('KDS000EP', 'EP', 'IDP14'), 
('KDS000EP', 'EP', 'IDP15'), 
('KDS000EF', 'EF', 'IDP16'), 
('KDS000EF', 'EF', 'IDP17'), 
('KDS000EF', 'EF', 'IDP18'), 
('KDS000EF', 'EF', 'IDP19'), 
('KDS000EP', 'EP', 'IDP20'), 
('KDS000EP', 'EP', 'IDP21'), 
('KDS000EP', 'EP', 'IDP22'), 
('KDS000EP', 'EP', 'IDP23'), 
('KDS000EA', 'EA', 'IDP24'), 
('KDS000EA', 'EA', 'IDP25'), 
('KDS000EA', 'EA', 'IDP26'), 
('KDS000EA', 'EA', 'IDP27'), 
('KDS000EB', 'EB', 'IDP28'), 
('KDS000EB', 'EB', 'IDP29'), 
('KDS000EB', 'EB', 'IDP30'), 
('KDS000EB', 'EB', 'IDP31'), 
('KDS000ES', 'ES', 'IDP40'),
('KDS000EP', 'EP', 'IDP47'),
('KDS000ES', 'ES', 'IDP41'),
('KDS000ES', 'ES', 'IDP42'),
('KDS000ES', 'ES', 'IDP43'),
('KDS000EF', 'EF', 'IDP48'),
('KDS000EF', 'EF', 'IDP49'),
('KDS000EF', 'EF', 'IDP39'),
('KDS000EF', 'EF', 'IDP38'),
('KDS000EP', 'EP', 'IDP46'),
('KDS000EF', 'EF', 'IDP50');