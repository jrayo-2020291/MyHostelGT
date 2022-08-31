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

Create table Hotel(
	codigoHotel int not null auto_increment,
	nombreHotel varchar(20) not null,
    puntuacion int not null,
    codigoRegion int not null,
    codigoVolumen int not null,
    primary key PK_codigoHotel (codigoHotel),
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
    codigoHotel int not null,
	primary key PK_numHabitacion (numHabitacion),
    constraint FK_Habitacion_Clasificacion foreign key (codigoClasificacion)
		references Clasificacion(codigoClasificacion),
	constraint FK_Habitacion_Hotel foreign key (codigoHotel)
		references Hotel(codigoHotel)
);

Create table Empleado(
	acceso int not null,
    nombreEmpleado varchar(200) not null,
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




