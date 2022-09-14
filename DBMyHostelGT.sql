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
    nombreCliente varchar(100) not null,
    apellidoCliente varchar(100) not null,
    telefono varchar(10) not null,
    DPI varchar (13) not null,
    direccion varchar(150) not null,
    correo varchar(100) not null,    
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
    saldoAPagar double not null,
    codigoClasificacion int not null,
    codigoSucursal int not null,
	primary key PK_numHabitacion (numHabitacion),
    constraint FK_Habitacion_Clasificacion foreign key (codigoClasificacion)
		references Clasificacion(codigoClasificacion),
	constraint FK_Habitacion_Sucursal foreign key (codigoSucursal)
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
    costReservacion double not null,
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
insert into Sucursal (descripcion, puntuacion, direccion, codigoRegion, codigoVolumen) values('Glamho Hotel','3', '6A Avenida 61-25, Zona 4 Mixco','1','2');
insert into Sucursal (descripcion, puntuacion, direccion, codigoRegion, codigoVolumen) values('Passarela Hotel','5', 'calle principal esperanza zona 12','2','1');
insert into Sucursal (descripcion, puntuacion, direccion, codigoRegion, codigoVolumen) values('Oz Resort','4', '2a Calle 713, Cobán','3','3');
insert into Sucursal (descripcion, puntuacion, direccion, codigoRegion, codigoVolumen) values('Queen Hotel','4', 'Tikal National Park, Flores, Tikal','4','4');
insert into Sucursal (descripcion, puntuacion, direccion, codigoRegion, codigoVolumen) values('Hotel el Bosque','2', 'Calle Union 20, Flores','5','1');
insert into Sucursal (descripcion, puntuacion, direccion, codigoRegion, codigoVolumen) values('Tea Tree Hotel','4', '9 Avenida 6-54 Zona 4','6','1');
insert into Sucursal (descripcion, puntuacion, direccion, codigoRegion, codigoVolumen) values('Candel Resort','5', '9a calle 2-25, San Marcos','7','2');
insert into Sucursal (descripcion, puntuacion, direccion, codigoRegion, codigoVolumen) values('EcoTel','3', 'X58W+74J, San Marcos','8','3');
insert into Sucursal (descripcion, puntuacion, direccion, codigoRegion, codigoVolumen) values('Trufa Resort','4', '4ta. Avenida, callejón zona 3','9','5');

/*---------------------------------------------------------------------------*/
-- Clientes
/*---------------------------------------------------------------------------*/

insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Santiago',' Hernandez','36235568','1248597685123','Zona 12, Guatemala','sHernandez68@gmail.com','2','1');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Mateo', 'Garcia','84523754','9875630124050','Zona 7, Mixco', 'mGarcia@gmail.com', '2','2');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Matias','Martinez','78121385', '9852037461204', 'Zona 8, Guatemala', 'mMartinez@gmail.com', '4','2');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Sebastian','Lopez','97116136','7546301204580','Zona 2, Cobán','sLopez@gmail.com','5','3');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Diego', 'Gonzalez','65524422','7564120314850', 'Zona 5, Salamá', 'dGonzalez@gmail.com', '6','1');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Nicolas' ,'Perez','72896069','7842001369540','Zona 3, Rabinal','nPerez@gmail.com' ,'1','5');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Luis', 'Rodriguez','49537371', '5432018702513', 'Zona 5, Cobán', 'lRodriguez@gmail.com', '1','4');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Samuel','Sanchez','80097161','4763021584630', 'Zona 1, Guatemala','sSanchez@gmail.com','4','1');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Steven', 'Ramirez','23551001','9564302106540','Zona 13, Chimaltenango','sRamirez@gmail.com','7','2');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Alejandro', 'Cruz','66758087','4620134895760','Zona 4, Patzun','aCruz@gmail.com','7','2');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Emilio', 'Flores','66758087','4615052789654','Zona 8, Acatenango', 'eFlores@gmail.com','3','3');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Javier', 'Gomez','68335152', '3120150789620','Zona 6, Flores(Petén)','jGomez@gmail.com','2','3');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Jose', 'Morales','11977809', '7945123065028','Zona 8, Guastatoya', 'jMorales@gmail.com','2','3');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Daniel','Vazquez','73434944','7852032016450','Zona 9, Mixco','dVazquez@gmail.com','5','2');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Pablo', 'Reyes','29626793','7856230145621','Zona 2, Guatemala','pReyes@gmail.com','1','1');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Luis', 'Jimenez','32943225', '3021549862054','Zona 5, Santa Crúz del Quiché','lJimenez@gmail.com', '3','5');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Samuel', 'Torres','42257565','6530214782030','Zona 12, Guatemala','sTorres@gmail.com','7','3');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Gabriel', 'Diaz','78208944','4521309875360','Zona 3, Patzun','gDiaz@gmail.com','4','2');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Sofia', 'Gutierrez','25186747','6320158463203','Zona 1, Chimaltenango','sGutierrez@gmail.com','4','6');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Isabella', 'Ruiz','21541938','2031504890500','Zona 6, Flores(Petén)','iRuiz@gmail.com','3','1');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Valentina','Mendoza','11860943','9875630215015','Zona 6, Guastatoya','vMendoza@gmail.com','2','1');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Chiao', 'Aguilar','71431069','6203512030125','Zona 1, Mixco','cAguilar@gmail.com','1','2');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Camila', 'Ortiz','31297023', '8865330147522','Zona 9, Escuintla','cOrtiz@gmail.com','1','3');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Valeria', 'Moreno','97487947','3320116877520','Zona 10, Siquinalá','vMoreno@gmail.com','2','3');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Emma', 'Castillo','62931644','5600213559780','Zona 3, Palin','eCastillo@gmail.com','2','4');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Luciana', 'Romero','61289664','9786320145200','Zona 15, Huehuetenango','lRomero@gmail.com','3','6');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Victoria', 'Alvarez','53263391','3115466200951','Zona 1, Puerto Barrios','vAlvarez@gmail.com','5','3');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Luisa', 'Mendez','72610802','6321006684520','Zona 2, El Estor','lMendez@gmail.com','6','1');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Martina','Chavez','84962708','9562300147596','Zona 15, El Estor','mChavez@gmail.com','6','1');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Ximena', 'Rivera','13650371','4652003258945','Zona 3, Jalapa','xRivera@gmail.com','7','2');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Ana', 'Juarez','42598362','5588463302100','Zona 3, Salcajá','aJuarez@gmail.com','2','1');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Flor', 'Ramos','83981139','2315006849510','Zona 3, Salcajá','fRamos@gmail.com','6','4');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Cecy', 'Domiguez','15233467','3215694800175','Zona 5, Guatemala','cDominguez@gmail.com','6','5');
insert into Cliente (nombreCliente, apellidoCliente, telefono, DPI, direccion, correo, CodigoMetodoPago, codigoTipoCliente) values ('Ivanna', 'Herrera','72596262','3656920015742','Zona 10, Champerico','iHerrera@gmail.com','6','3');

/*---------------------------------------------------------------------------*/
-- Habitaciones
/*---------------------------------------------------------------------------*/

insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',300, '1','1');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Libre',200, '2','1');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',150, '2','1');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',250, '3','1');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',200, '1','1');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Libre',100, '1','2');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Libre',150,'2','2');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',150,'1','2');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',100,'3','2');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',250,'4','2');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',150,'5','3');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',250,'3','3');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',350,'2','3');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',200,'6','3');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Libre',150,'3','3');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',300,'1','4');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',100,'1','4');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',150,'2','4');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',300,'3','4');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',350,'3','4');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Libre',100,'2','5');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',200,'2','5');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',200,'1','5');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',300,'1','5');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',240,'4','5');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',210,'5','6');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Libre',320,'5','6');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Libre',260,'3','6');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Mantenimiento',290,'2','6');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',340,'3','6');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',190,'2','7');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',199.99,'2','7');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Mantenimiento',299.99,'2','7');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',150.99,'3','7');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Mantenimiento',180,'5','7');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',210,'6','8');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',240,'1','8');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',280,'3','8');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',170,'2','8');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',150,'3','8');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Mantenimiento',300,'5','9');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Libre',150,'1','9');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',150,'5','9');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',200,'1','9');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Mantenimiento',200,'2','9');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Libre',150,'2','10');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Libre',150,'2','10');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',300,'3','10');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Ocupada',300,'3','10');
insert into Habitacion (estado, saldoAPagar, codigoClasificacion, codigoSucursal) values('Libre',300,'1','10');

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

insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("5/9/2022","9/9/2022", 202.25,"1","1","1001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("6/9/2022","8/9/2022", 202.25,"2","3","1001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("9/9/2022","11/9/2022", 202.25, "3","4","1001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("11/9/2022","14/9/2022", 202.25, "4","5","1001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("14/9/2022","19/9/2022", 202.25, "5","8","1001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("17/9/2022","20/9/2022", 250.25, "6","9","2001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("23/9/2022","25/9/2022", 250.25, "7","10","2001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("26/9/2022","28/9/2022", 250.25, "8","11","2001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("29/9/2022","30/9/2022", 250.25, "9","12","2001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("3/10/2022","5/10/2022", 250.25, "10","13","2001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("5/10/2022","9/10/2022", 300.25, "11","14","3001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("6/10/2022","11/10/2022", 300.25, "12","16","3001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("11/10/2022","12/10/2022", 300.25, "13","17","3001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("13/10/2022","15/10/2022", 300.25, "14","18","3001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("14/10/2022","17/10/2022", 300.25, "15","19","3001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("18/10/2022","20/10/2022", 350.25, "16","20","4001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("22/10/2022","26/10/2022", 350.25, "17","22","4001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("23/10/2022","26/10/2022", 350.25, "18","23","4001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("24/10/2022","25/10/2022", 350.25, "19","24","4001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("30/10/2022","3/11/2022", 350.25, "20","25","4001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("1/11/2022","4/11/2022", 450.25, "21","26","5001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("1/11/2022","6/11/2022", 450.25, "22","30","5001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("4/11/2022","7/11/2022", 450.25, "23","31","5001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("5/11/2022","9/11/2022", 450.25, "24","32","5001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("7/11/2022","11/11/2022", 450.25, "25","34","5001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("9/11/2022","11/11/2022", 202.25, "26","36","1001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("11/11/2022","15/11/2022", 250.25, "27","37","2001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("13/11/2022","16/11/2022", 300.25, "28","38","3001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("14/11/2022","17/11/2022", 350.25, "29","39","4001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("17/11/2022","20/11/2022", 400.25, "30","40","5001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("17/11/2022","21/11/2022", 202.25, "31","43","1001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("18/11/2022","22/11/2022", 250.25, "32","44","2001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("19/11/2022","24/11/2022", 300.25, "33","48","3001");
insert into Reservacion (fechaEntrada, fechaSalida, costReservacion, ID, numHabitacion, acceso) values ("21/11/2022","26/11/2022", 350.25, "34","49","4001");

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


