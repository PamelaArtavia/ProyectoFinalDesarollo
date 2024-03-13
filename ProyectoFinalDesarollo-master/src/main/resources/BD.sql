drop schema if exists anggelusestetica;
drop user if exists usuario_estetica;

CREATE SCHEMA anggelusestetica ;

create user 'usuario_estetica'@'%' identified by 'Usuar1o_Estetica.';

grant all privileges on anggelusestetica.* to 'usuario_estetica'@'%';
flush privileges;


CREATE TABLE anggelusestetica.comprar (
  id_comprar INT NOT NULL AUTO_INCREMENT,
  tipo VARCHAR(50) NOT NULL,
  descripcion VARCHAR(100) NOT NULL,
  ruta_imagen VARCHAR(1024),
  activo BOOL,
  PRIMARY KEY (id_comprar)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE anggelusestetica.servicios_destacados (
  id_servicio INT NOT NULL AUTO_INCREMENT,
  id_comprar INT NOT NULL,
  descripcion VARCHAR(100) NOT NULL,  
  detalle VARCHAR(1600) NOT NULL, 
  precio DOUBLE,
  ruta_imagen VARCHAR(1024),
  activo BOOL,
  PRIMARY KEY (id_servicio),
  FOREIGN KEY fk_servicio_comprar (id_comprar) REFERENCES comprar(id_comprar)  
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE anggelusestetica.productos_recomendados (
  id_producto INT NOT NULL AUTO_INCREMENT,
  id_comprar INT NOT NULL,
  descripcion VARCHAR(100) NOT NULL,  
  detalle VARCHAR(1600) NOT NULL, 
  precio DOUBLE,
  existencias INT,  
  ruta_imagen VARCHAR(1024),
  activo BOOL,
  PRIMARY KEY (id_producto),
  FOREIGN KEY fk_producto_comprar (id_comprar) REFERENCES comprar(id_comprar)  
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

/* Se insertan 2 comprar como servicios y productos */
INSERT INTO anggelusestetica.comprar (tipo, descripcion, ruta_imagen, activo)
VALUES 
('Servicios destacados', 'Servicios Destacados de la estetica', 'https://www.lavanguardia.com/files/content_image_mobile_filter/uploads/2021/06/04/60ba06b7a5651.jpeg', true),
('Productos recomendados', 'Productos Recomendados de la estetica', 'https://supersalonenlinea.com/wp-content/uploads/2022/07/594010-3.jpg', true);

/* Se insertan 3 productos y 3 servicios */
INSERT INTO anggelusestetica.servicios_destacados (id_comprar, descripcion, detalle, precio, ruta_imagen, activo)
VALUES
(1, 'Limpiezas faciales profundas', 'La limpieza facial profunda elimina los puntos negros y las células muertas, consiguiendo que la piel respire',15000, 'https://www.lavanguardia.com/files/content_image_mobile_filter/uploads/2021/06/04/60ba06b7a5651.jpeg', true),
(1, 'Depilación de cejas','Se puede escoger la depilación de cejas con cera o con hilo, según la preferencia del cliente.',3000,'https://catalinajaramillo.com.co/cdn/shop/files/Diseno-de-cejas.jpg?v=1675109686&width=1500',true),
(1, 'Lifting de pestañas','Es un tratamiento que eleva la curvatura de tus pestañas, resaltando la expresión de la mirada y alargando las pestañas desde la raíz, sin utilizar pelo sintético.',1400,'https://i0.wp.com/www.gregorioporras.com/wp-content/uploads/2023/02/lifting_de_pestanas_precio.jpg?ssl=1',true);

INSERT INTO anggelusestetica.productos_recomendados (id_comprar, descripcion, detalle, precio, existencias, ruta_imagen, activo)
VALUES
(2, 'Crema secante de té de árbol Exel','Ayuda a regular el desarrollo del acné con una acción antiséptica y seboreguladora. Para pieles grasas y/o acneicas',14000,6,'https://cosmetologasargentinas.com/920-large_default/acne-crema-jabonosa-ph-no-alc-ttoil-250-ml-exel.jpg',true),
(2, 'Crema hidratante Exel','Ayuda a prevenir y restaurar el nivel de humedad de la piel.',24000,4,'https://eshop.jezmin.com.ar/4859-thickbox_default/biocosmetica-exel-crema-hidratante-con-gel-de-aloe-vera-y-vitamina-e-240-gr-.jpg',true),
(2, 'Vitamina C Exel','Hidrata y suaviza. Mejora la luminosidad y tersura epidérmica. Posee acción antioxidante. Forma un film resistente a los rayos UVA/UVB y radicales libres.',18500,6,'https://cosmetologasargentinas.com/614-large_default/concentrado-facial-gel-hidrat-reparador-c-lip-vit-30-ml-exel.jpg',true);
