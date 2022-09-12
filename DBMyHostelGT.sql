Drop database if exists DBMyHostelGT;
Create database DBMyHostelGT;

Use DBMyHostelGT;

Create table MetodoDePago(
	codigoMetodoPago int not null auto_increment,
    descripcion varchar(50) not null,
    primary key PK_numMetodoPago (codigoMetodoPago)
);

Create table Clasificacion(
	codigoClasificacion int not null auto_increment,
    categoria varchar (20) not null,
    primary key PK_codigoClasificacion (codigoClasificacion)
);

Create table Volumen(
	codigoVolumen int not null auto_increment,
    volumen varchar(20) not null,
    primary key PK_codigoTamaño (codigoVolumen)
);

Create table Region(
	codigoRegion int auto_increment,
    region varchar(50) not null,
    primary key PK_codigoRegion (codigoRegion)
);

Create table TipoEmpleado(
	codigoTipoEmpleado int not null auto_increment,
    descripcion varchar(20) not null,
    primary key PK_codigoTipoEmpleado (codigoTipoEmpleado)
);

Create table TipoCliente(
	codigoTipoCliente int not null auto_increment,
    descripcion varchar(20) not null,
    primary key PK_codigoTipoCliente (codigoTipoCliente)
);

Create table Sucursal(
	codigoSucursal int not null auto_increment,
	descripcion varchar(20) not null,
    puntuacion int not null,
    direccion varchar(40) not null,
    codigoRegion int not null,
    codigoVolumen int not null,
    primary key PK_codigoHotel (codigoSucursal),
    constraint FK_Hotel_Region foreign key (codigoRegion)
		references Region(codigoRegion),
	constraint FK_Hotel_Volumen foreign key (codigoVolumen)
		references Volumen(codigoVolumen)
);

Create table Cliente(
	ID int not null auto_increment,
    nombreCliente varchar(200) not null,
    telefono varchar(10) not null,
    codigoMetodoPago int not null,
    codigoTipoCliente int not null,
    primary key PK_ID (ID),
    constraint FK_Cliente_MetodoDePago foreign key (codigoMetodoPago)
		references MetodoDePago(codigoMetodoPago),
	constraint FK_Cliente_TipoCliente foreign key (codigoTipoCliente)
		references TipoCliente(codigoTipoCliente)
);

Create table Habitacion(
	numHabitacion int not null auto_increment,
    estado varchar(20) not null,
    codigoClasificacion int not null,
    codigoSucursal int not null,
	primary key PK_numHabitacion (numHabitacion),
    constraint FK_Habitacion_Clasificacion foreign key (codigoClasificacion)
		references Clasificacion(codigoClasificacion),
	constraint FK_Habitacion_Hotel foreign key (codigoSucursal)
		references Sucursal(codigoSucursal)
);


Create table Empleado(
	acceso int not null,
    dpiEmpleado varchar(13) not null,
    nombreEmpleado varchar(200) not null,
    apellidoEmpleado varchar(200) not null,
    correoEmpleado varchar(200) not null,
    telefono varchar(10) not null,
    usuario varchar(15) not null,
    codigotipoEmpleado int not null,
    primary key PK_acceso (acceso),
    constraint FK_Empleado_TipoEmpleado foreign key (codigoTipoEmpleado)
		references TipoEmpleado(codigoTipoEmpleado)
);

Create table Reservacion(
	codigoReservacion int not null auto_increment,
    fechaEntrada varchar(10) not null,
    fechaSalida varchar(10) not null,
    ID int not null,
    numHabitacion int not null,
    acceso int not null,
    primary key PK_codigoReservacion (codigoReservacion),
    constraint FK_Reservacion_Habitacion foreign key (numHabitacion)
		references Habitacion(numHabitacion),
	constraint FK_Reservacion_Cliente foreign key (ID)
		references Cliente(ID),
	constraint FK_Reservacion_Empleado foreign key (acceso)
		references Empleado(acceso)
);

//*<<<<<<< Updated upstream
/*---------------------------------------------------------------------------*/
-- INSERTS
/*---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------*/
-- Metodo de Pago
/*---------------------------------------------------------------------------*/

insert into MetodoDePago (descripcion) values('Efectivo');
insert into MetodoDePago (descripcion) values('Tarjeta');
insert into MetodoDePago (descripcion) values('Tarjeta Prepago');
insert into MetodoDePago (descripcion) values('Cheque');
insert into MetodoDePago (descripcion) values('Transferencia');
insert into MetodoDePago (descripcion) values('Bitcoin');
insert into MetodoDePago (descripcion) values('PayPal');

/*---------------------------------------------------------------------------*/
-- Clasificacion
/*---------------------------------------------------------------------------*/

insert into Clasificacion (categoria) values('Normal 1 Cama');
insert into Clasificacion (categoria) values('Normal 2 Camas');
insert into Clasificacion (categoria) values('Deluxe 2 Camas');
insert into Clasificacion (categoria) values('Suite Ejecutiva');
insert into Clasificacion (categoria) values('Master Suite');
insert into Clasificacion (categoria) values('Deluxe 1 Cama');

/*---------------------------------------------------------------------------*/
-- Volumen
/*---------------------------------------------------------------------------*/

insert into Volumen (volumen) values('15');
insert into Volumen (volumen) values('20');
insert into Volumen (volumen) values('25');
insert into Volumen (volumen) values('30');
insert into Volumen (volumen) values('35');
insert into Volumen (volumen) values('40');
insert into Volumen (volumen) values('45');

/*---------------------------------------------------------------------------*/
-- Region
/*---------------------------------------------------------------------------*/

insert into Region (region) values('Peten');
insert into Region (region) values('Ciudad Guatemala');
insert into Region (region) values('Escuintla');
insert into Region (region) values('Solola');
insert into Region (region) values('Huehuetenango');
insert into Region (region) values('Izabal');
insert into Region (region) values('Chiquimula');
insert into Region (region) values('San Marcos');
insert into Region (region) values('Retalhuleu');

/*---------------------------------------------------------------------------*/
-- Tipo de Empleado
/*---------------------------------------------------------------------------*/

insert into TipoEmpleado (descripcion) values('Recepcionista');
insert into TipoEmpleado (descripcion) values('Camarero');
insert into TipoEmpleado (descripcion) values('Chef');
insert into TipoEmpleado (descripcion) values('Conserje');
insert into TipoEmpleado (descripcion) values('Gerente');
insert into TipoEmpleado (descripcion) values('SubGerente');
insert into TipoEmpleado (descripcion) values('Mucama');
insert into TipoEmpleado (descripcion) values('Programador');
insert into TipoEmpleado (descripcion) values('Gerente Progra');

/*---------------------------------------------------------------------------*/
-- Tipo de Cliente
/*---------------------------------------------------------------------------*/

insert into TipoCliente (descripcion) values('Plata');
insert into TipoCliente (descripcion) values('Oro');
insert into TipoCliente (descripcion) values('Diamamnte');
insert into TipoCliente (descripcion) values('Diamante ++');
insert into TipoCliente (descripcion) values('Platino');
insert into TipoCliente (descripcion) values('Platino ++');

/*---------------------------------------------------------------------------*/
-- Hotel
/*---------------------------------------------------------------------------*/

insert into Sucursal (descripcion, puntuacion, direccion, codigoRegion, codigoVolumen) values('Hotel Realeza','4', '6A Avenida 61-25, Cdad. de Guatemala','1','3'); 
insert into Sucursal (descripcion, puntuacion, direccion, codigoRegion, codigoVolumen) values('Glamho Hotel','3', '6A Avenida 61-25, Cdad. de Guatemala','1','2');
insert into Sucursal (descripcion, puntuacion, direccion, codigoRegion, codigoVolumen) values('Passarela Hotel','5', '6A Avenida 61-25, Cdad. de Guatemala','2','1');
insert into Sucursal (descripcion, puntuacion, direccion, codigoRegion, codigoVolumen) values('Oz Resort','4', '6A Avenida 61-25, Cdad. de Guatemala','3','3');
insert into Sucursal (descripcion, puntuacion, direccion, codigoRegion, codigoVolumen) values('Queen Hotel','4', '6A Avenida 61-25, Cdad. de Guatemala','4','4');
insert into Sucursal (descripcion, puntuacion, direccion, codigoRegion, codigoVolumen) values('Hotel el Bosque','2', '6A Avenida 61-25, Cdad. de Guatemala','5','1');
insert into Sucursal (descripcion, puntuacion, direccion, codigoRegion, codigoVolumen) values('Tea Tree Hotel','4', '6A Avenida 61-25, Cdad. de Guatemala','6','1');
insert into Sucursal (descripcion, puntuacion, direccion, codigoRegion, codigoVolumen) values('Candel Resort','5', '6A Avenida 61-25, Cdad. de Guatemala','7','2');
insert into Sucursal (descripcion, puntuacion, direccion, codigoRegion, codigoVolumen) values('EcoTel','3', '6A Avenida 61-25, Cdad. de Guatemala','8','3');
insert into Sucursal (descripcion, puntuacion, direccion, codigoRegion, codigoVolumen) values('Trufa Resort','4', '6A Avenida 61-25, Cdad. de Guatemala','9','5');

/*---------------------------------------------------------------------------*/
-- Clientes
/*---------------------------------------------------------------------------*/

insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Santiago Hernandez','36235568','2','1');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Mateo Garcia','84523754','2','2');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Matias Martinez','78121385','4','2');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Sebastian Lopez','97116136','5','3');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Diego Gonzalez','65524422','6','1');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Nicolas Perez','72896069','1','5');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Luis Rodriguez','49537371','1','4');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Samuel Sanchez','80097161','4','1');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Steven Ramirez','23551001','7','2');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Alejandro Cruz','66758087','7','2');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Emilio Flores','66758087','3','3');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Javier Gomez','68335152','2','3');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Jose Morales','11977809','2','3');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Daniel Vazquez','73434944','5','2');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Pablo Reyes','29626793','1','1');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Luis Jimenez','32943225','3','5');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Samuel Torres','42257565','7','3');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Gabriel Diaz','78208944','4','2');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Sofia Gutierrez','25186747','4','6');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Isabella Ruiz','21541938','3','1');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Valentina Mendoza','11860943','2','1');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Chiao Aguilar','71431069','1','2');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Camila Ortiz','31297023','1','3');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Valeria Moreno','97487947','2','3');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Emma Castillo','62931644','2','4');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Luciana Romero','61289664','3','6');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Victoria Alvarez','53263391','5','3');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Luisa Mendez','72610802','6','1');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Martina Chavez','84962708','6','1');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Ximena Rivera','13650371','7','2');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Ana Juarez','42598362','2','1');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Flor Ramos','83981139','6','4');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Cecy Domiguez','15233467','6','5');
insert into Cliente (nombreCliente, telefono, CodigoMetodoPago, codigoTipoCliente) values ('Ivanna Herrera','72596262','6','3');

/*---------------------------------------------------------------------------*/
-- Habitaciones
/*---------------------------------------------------------------------------*/

insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','1','1');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Libre','2','1');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','2','1');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','3','1');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','1','1');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Libre','1','2');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Libre','2','2');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','1','2');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','3','2');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','4','2');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','5','3');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','3','3');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','2','3');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','6','3');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Libre','3','3');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','1','4');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','1','4');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','2','4');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','3','4');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','3','4');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Libre','2','5');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','2','5');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','1','5');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','1','5');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','4','5');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','5','6');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Libre','5','6');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Libre','3','6');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Mantenimiento','2','6');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','3','6');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','2','7');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','2','7');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Mantenimiento','2','7');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','3','7');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Mantenimiento','5','7');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','6','8');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','1','8');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','3','8');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','2','8');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','3','8');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Mantenimiento','5','9');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Libre','1','9');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','5','9');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','1','9');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Mantenimiento','2','9');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Libre','2','10');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Libre','2','10');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','3','10');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Ocupada','3','10');
insert into Habitacion (estado, codigoClasificacion, codigoSucursal) values('Libre','1','10');

/*---------------------------------------------------------------------------*/
-- Empleados (Programadores)
/*---------------------------------------------------------------------------*/

insert into Empleado (acceso, dpiEmpleado, nombreEmpleado, apellidoEmpleado, correoEmpleado, telefono, usuario, codigoTipoEmpleado) values ('2018521','1','Carlos ','Ramos','cramos-2018457@kinal.edu.gt','39049278','Cramos','8');
insert into Empleado (acceso, dpiEmpleado, nombreEmpleado, apellidoEmpleado, correoEmpleado, telefono, usuario, codigoTipoEmpleado) values ('2021117','2','José','Vasquez','jvasquez-2021117@kinal.edu.gt','394750289','Jvasquez','8');
insert into Empleado (acceso, dpiEmpleado, nombreEmpleado, apellidoEmpleado, correoEmpleado, telefono, usuario, codigoTipoEmpleado) values ('2018253','3','Ian','Monterroso','imonterroso-2018253@kinal.edu.gt','30472894','Imonterroso','8');
insert into Empleado (acceso, dpiEmpleado, nombreEmpleado, apellidoEmpleado, correoEmpleado, telefono, usuario, codigoTipoEmpleado) values ('2018457','3024250040102','Juan','Montenegro','jmontenegro-2018457@kinal.edu.gt','39047294','Jmontenegro','8');
insert into Empleado (acceso, dpiEmpleado, nombreEmpleado, apellidoEmpleado, correoEmpleado, telefono, usuario, codigoTipoEmpleado) values ('2018384','5','Jose','Ramirez','jramirez-2018384@kinal.edu.gt','04738294','Jramirez','8');
insert into Empleado (acceso, dpiEmpleado, nombreEmpleado, apellidoEmpleado, correoEmpleado, telefono, usuario, codigoTipoEmpleado) values ('2018317','6','Juan','Morales','jmorales-2018317@kinal.edu.gt','32084719','Jmorales','8');
insert into Empleado (acceso, dpiEmpleado, nombreEmpleado, apellidoEmpleado, correoEmpleado, telefono, usuario, codigoTipoEmpleado) values ('2021131','7','Sergio','Tan','stan-2021131@kinal.edu.gt','63301784','Stan','8');
insert into Empleado (acceso, dpiEmpleado, nombreEmpleado, apellidoEmpleado, correoEmpleado, telefono, usuario, codigoTipoEmpleado) values ('2018481','8','Yohan','Rodas','yrodas-2018481@kinal.edu.gt','83022845','Yrodas','8');
insert into Empleado (acceso, dpiEmpleado, nombreEmpleado, apellidoEmpleado, correoEmpleado, telefono, usuario, codigoTipoEmpleado) values ('2020291','9','Jose','Rayo','jrayo-2020291@kinal.edu.gt','77301835','Jrayo','9');
insert into Empleado (acceso, dpiEmpleado, nombreEmpleado, apellidoEmpleado, correoEmpleado, telefono, usuario, codigoTipoEmpleado) values ('2021120','10','Edgar','Reyes','ereyes-2021120@kinal.edu.gt','10364881','Ereyes','8');
insert into Empleado (acceso, dpiEmpleado, nombreEmpleado, apellidoEmpleado, correoEmpleado, telefono, usuario, codigoTipoEmpleado) values ('2021586','11','Jose','Peralta','jperalta-2021586@kinal.edu.gt','03746189','Jperalta','8');
insert into Empleado (acceso, dpiEmpleado, nombreEmpleado, apellidoEmpleado, correoEmpleado, telefono, usuario, codigoTipoEmpleado) values ('2018044','12','Pablo','Vasquez','pvasquez-2018044@kinal.edu.gt','58962456','Pvasquez','8');

/*---------------------------------------------------------------------------*/
-- Empleados (Hoteles)
/*---------------------------------------------------------------------------*/

insert into Empleado (acceso, dpiEmpleado, nombreEmpleado, apellidoEmpleado, correoEmpleado, telefono, usuario, codigoTipoEmpleado) values ('1001','13','Jose','Alvarado','jalvarado-1001@kinal.edu.gt','30471932','Jalvarado','1');
insert into Empleado (acceso, dpiEmpleado, nombreEmpleado, apellidoEmpleado, correoEmpleado, telefono, usuario, codigoTipoEmpleado) values ('2001','14','Pedro','Lopez','plopez-2001@kinal.edu.gt','36479801','Plopez','1');
insert into Empleado (acceso, dpiEmpleado, nombreEmpleado, apellidoEmpleado, correoEmpleado, telefono, usuario, codigoTipoEmpleado) values ('3001','15','Manuel','Lainez','mlainez-3001@kinal.edu.gt','27485909','Mlainez','1');
insert into Empleado (acceso, dpiEmpleado, nombreEmpleado, apellidoEmpleado, correoEmpleado, telefono, usuario, codigoTipoEmpleado) values ('4001','16','Jacinto','Quiñonez','jquiñonez-4001@kinal.edu.gt','14368702','JQuiñonez','1');
insert into Empleado (acceso, dpiEmpleado, nombreEmpleado, apellidoEmpleado, correoEmpleado, telefono, usuario, codigoTipoEmpleado) values ('5001','17','Juan','Herrera','jherrera-5001@kinal.edu.gt','15647238','JHerrera','1');

/*---------------------------------------------------------------------------*/
-- Reservaciones
/*---------------------------------------------------------------------------*/

insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('5/9/2022','9/9/2022','1','1','1001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('6/9/2022','8/9/2022','2','3','1001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('9/9/2022','11/9/2022','3','4','1001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('11/9/2022','14/9/2022','4','5','1001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('14/9/2022','19/9/2022','5','8','1001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('17/9/2022','20/9/2022','6','9','2001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('23/9/2022','25/9/2022','7','10','2001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('26/9/2022','28/9/2022','8','11','2001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('29/9/2022','30/9/2022','9','12','2001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('3/10/2022','5/10/2022','10','13','2001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('5/10/2022','9/10/2022','11','14','3001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('6/10/2022','11/10/2022','12','16','3001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('11/10/2022','12/10/2022','13','17','3001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('13/10/2022','15/10/2022','14','18','3001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('14/10/2022','17/10/2022','15','19','3001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('18/10/2022','20/10/2022','16','20','4001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('22/10/2022','26/10/2022','17','22','4001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('23/10/2022','26/10/2022','18','23','4001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('24/10/2022','25/10/2022','19','24','4001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('30/10/2022','3/11/2022','20','25','4001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('1/11/2022','4/11/2022','21','26','5001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('1/11/2022','6/11/2022','22','30','5001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('4/11/2022','7/11/2022','23','31','5001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('5/11/2022','9/11/2022','24','32','5001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('7/11/2022','11/11/2022','25','34','5001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('9/11/2022','11/11/2022','26','36','1001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('11/11/2022','15/11/2022','27','37','2001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('13/11/2022','16/11/2022','28','38','3001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('14/11/2022','17/11/2022','29','39','4001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('17/11/2022','20/11/2022','30','40','5001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('17/11/2022','21/11/2022','31','43','1001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('18/11/2022','22/11/2022','32','44','2001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('19/11/2022','24/11/2022','33','48','3001');
insert into Reservacion (fechaEntrada, fechaSalida, ID, numHabitacion, acceso) values ('21/11/2022','26/11/2022','34','49','4001');

/*---------------------------------------------------------------------------*/
-- SELECTS
/*---------------------------------------------------------------------------*/
Select * from MetododePago;
Select * from Clasificacion;
Select * from Volumen;
Select * from Region;
Select * from TipoEmpleado;
Select * from TipoCliente;
Select * from Sucursal;
Select * from Cliente;
Select * from Habitacion;
Select * from Empleado;
Select * from Reservacion;


