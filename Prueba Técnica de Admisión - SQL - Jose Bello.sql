--Pregunta 1
--Crea cada una de las tablas mediante sentencias SQL, poniendo énfasis a las relaciones de llaves primarias, llaves foráneas, y campos. Se debe subentender el tipo de dato correspondiente a cada atributo de la tabla.

CREATE TABLE categories(
  id                 int(255) auto_increment not null,
  category_name      varchar(255) not null,
  description        varchar(255) not null,
  picture            varchar(255) not null,
  CONSTRAINT pk_categories PRIMARY KEY(id),
)ENGINE=InnoDb;

CREATE TABLE suppliers(
  id                int(255) auto_increment not null,
  company_name      varchar(255) not null,
  contact_name      varchar(255) not null,
  contac_title      varchar(255) not null,
  address           varchar(255) not null,
  city              varchar(100) not null,
  region            varchar(100) not null,
  postal_code       varchar(255) not null,
  country           varchar(100) not null,
  phone             varchar(100) not null,
  fax               varchar(255) not null,
  home_page         varchar(255) not null,
  CONSTRAINT pk_suppliers PRIMARY KEY(id),
)ENGINE=InnoDb;

CREATE TABLE products(
  id                int(255) auto_increment not null,
  product_name      varchar(255) not null,
  supplier_id       varchar(255) not null,
  category_id       varchar(255) not null,
  quantity_perunit  varchar(255) not null,
  unit_price        varchar(255) not null,
  units_in_stock    varchar(255) not null,
  units_on_order    varchar(255) not null,
  reorder_level     varchar(100) not null,
  discontinued      varchar(100) not null,
  CONSTRAINT pk_products PRIMARY KEY(id),
  CONSTRAINT fk_product_supplier FOREIGN KEY(supplier_id) REFERENCES suppliers(id),
  CONSTRAINT fk_product_category FOREIGN KEY(category_id) REFERENCES categories(id),
)ENGINE=InnoDb;

CREATE TABLE order_details(
  order_id         varchar(255) not null,
  product_id       varchar(255) not null,
  unit_price       varchar(255) not null,
  quantity         varchar(255) not null,
  CONSTRAINT pk_order_details PRIMARY KEY(id),
  CONSTRAINT fk_order_detail_product FOREIGN KEY(product_id) REFERENCES products(id),
  CONSTRAINT fk_order_detail_product FOREIGN KEY(order_id) REFERENCES products(id),
)ENGINE=InnoDb;

CREATE TABLE employess(
  id                int(255) auto_increment not null,
  last_name         varchar(100) not null,
  first_name        varchar(100) not null,
  title             varchar(255) not null,
  title_of_courtesy varchar(255) not null,
  birth_date        date not null,
  hire_date         date not null,
  address           varchar(255) not null,
  city              varchar(100) not null,
  region            varchar(100) not null,
  postal_code       varchar(255) not null,
  country           varchar(100) not null,
  home_phone        varchar(100) not null,
  extension         varchar(100) not null,
  photo             varchar(255) not null,
  notes             varchar(255) not null,
  reports_to        varchar(100) not null,
  CONSTRAINT pk_employess PRIMARY KEY(id),
)ENGINE=InnoDb;

CREATE TABLE orders(
  id                int(255) auto_increment not null,
  customer_id       varchar(255) not null,
  employee_id       varchar(255) not null,
  shipper_id        varchar(255) not null,
  order_date        date not null,
  required_date     date not null,
  shipped_date      date not null,
  ship_via          varchar(255) not null,
  freight           varchar(255) not null,
  ship_name         varchar(100) not null,
  ship_address      varchar(255) not null,
  ship_city         varchar(100) not null,
  ship_region       varchar(100) not null,
  ship_postal_code  varchar(255) not null,
  ship_country      varchar(100) not null,
  CONSTRAINT pk_orders PRIMARY KEY(id),
  CONSTRAINT fk_order_customer FOREIGN KEY(customer_id) REFERENCES customers(id),
  CONSTRAINT fk_order_employee FOREIGN KEY(employee_id) REFERENCES employess(id),
  CONSTRAINT fk_order_shipper  FOREIGN KEY(shipper_id)  REFERENCES shippers (id)
)ENGINE=InnoDb;

--Nota: en el dibujo enviado la tabla "orders" no tiene el "shipper_id", debería tener esa relación.

CREATE TABLE customers(
  id                int(255) auto_increment not null,
  company_name      varchar(255) not null,
  contact_name      varchar(255) not null,
  contac_title      varchar(255) not null,
  address           varchar(255) not null,
  city              varchar(100) not null,
  region            varchar(100) not null,
  postal_code       varchar(255) not null,
  country           varchar(100) not null,
  phone             varchar(100) not null,
  fax               varchar(255) not null,
  CONSTRAINT pk_customers PRIMARY KEY(id),
)ENGINE=InnoDb;

CREATE TABLE shippers(
  id                int(255) auto_increment not null,
  company_name      varchar(255) not null,
  phone             varchar(100) not null,
  CONSTRAINT pk_shippers PRIMARY KEY(id),
)ENGINE=InnoDb;


--Pregunta 2
--Obtén mediante una consulta SQL todos los datos de los 5 primeros empleados (Employees) cuyos nombres (FirstName) sea ‘Daniel’.
SELECT * FROM employess WHERE first_name = "Daniel" ORDER BY id ASC LIMIT 5;

--Pregunta 3
--Obtén mediante una consulta SQL el ID del producto (ProductID), el Nombre del Producto (ProductName) y el nombre de la categoría (CategoryName) de todos los productos de la base de datos.
SELECT products.id, products.product_name, categories.category_name FROM products LEFT JOIN categories ON products.category_id == categories.id ORDER BY products.id ASC;

--Pregunta 4
--Obtén mediante una consulta SQL el encabezado del pedido N°1535. Para ello debes considerar traer Nombre del Cliente, Dirección, Ciudad Región y País del cliente, Nombre y apellido del empleado (vendedor).
SELECT customers.company_name, customers.address, customers.city, customers.region, customers.country, employess.first_name, employess.last_name FROM orders OUTER JOIN employess ON orders.employee_id == employess.id OUTER JOIN customers ON orders.customer_id == customers.id WHERE orders.id = 1535 ORDER BY orders.id ASC LIMIT 1;

--Pregunta 5
--Obtén mediante una consulta SQL los detalles del pedido N°1535. Para ello debes considerar traer Número de Pedido, Nombre del Producto, Nombre de la Categoría, Precio Unitario y Cantidad.
SELECT orders.id, products.product_name, categories.category_name, order_details.unit_price, order_details.quantity FROM orders OUTER JOIN order_details ON orders.id == order_details.order_id OUTER JOIN products ON products.id == order_details.product_id OUTER JOIN categories ON categories.id == products.category_id WHERE orders.id = 1535 ORDER BY orders.id ASC LIMIT 1;

--Pregunta 6
--Obtén el total de los pedidos para el mes de Abril de 2021.
SELECT COUNT(*) FROM orders WHERE MONTH(order_date) = 4 AND YEAR(order_date) = 2021;
