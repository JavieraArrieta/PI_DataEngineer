DROP DATABASE IF EXISTS pi_data04;
CREATE DATABASE IF NOT EXISTS pi_data04;
USE pi_data04;


DROP TABLE IF EXISTS `sucursal`;
CREATE TABLE IF NOT EXISTS `sucursal` (

  	`principalId` 	VARCHAR(50),
  	`comercioId` 		VARCHAR(50),			
    `banderaId`		VARCHAR(50),
    `sucursalId`	VARCHAR(50),
  	`banderaDescripcion` 		VARCHAR(100),
    `comercioRazonSocial`		VARCHAR(100),
    `provincia`		VARCHAR(100),
    `Localidad`		VARCHAR(100),
    `direccion`		VARCHAR(100),
    `lat`		VARCHAR(100),
    `lng`		VARCHAR(100),
    `sucursalNombre`		VARCHAR(100),
    `sucursalTipo`		VARCHAR(100),
    primary key (`principalId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;	
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sucursal.csv'
INTO TABLE `sucursal`
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES;


DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  	`productoId` 	VARCHAR(100),
  	`marca` 		VARCHAR(100),			
    `nombre`		VARCHAR(130),
    `presentacion`	VARCHAR(100),
    primary key (`productoId` )
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;	
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\producto.csv'
INTO TABLE `producto`
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;


DROP TABLE IF EXISTS `precio`;
CREATE TABLE IF NOT EXISTS `precio` (
  	`precio` 	VARCHAR(100),
  	`producto_id` 		VARCHAR(100),			
    `sucursal_id`		VARCHAR(130),
    `fecha` 		VARCHAR(100)
	# foreign key (`producto_id`) references `producto`(`productoId`),
    # foreign key (`sucursal_id`) references `sucursal`(`sucursalId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;	
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\precio.csv'
INTO TABLE `precio`
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

ALTER TABLE `precio` ADD FOREIGN KEY (`producto_id`) REFERENCES `producto`(`productoId`);
# ALTER TABLE `precio` ADD FOREIGN KEY (`sucursal_id`) REFERENCES `sucursal`(`principalId`) ON DELETE CASCADE; 
# no me funciono, lo hice desde el diagrama
select count(*) from precio;

