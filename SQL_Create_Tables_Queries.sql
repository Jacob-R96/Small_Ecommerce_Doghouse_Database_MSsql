create table Customer (
	CustomerID int  not null identity(1,1),
	first_name nvarchar(50) not null,
	last_name nvarchar(50) not null,
	Phone  nvarchar(15) not null,
	Email nvarchar(100) null,
	Constraint CustomerPK Primary Key(CustomerID)
)

create table StateFees(
	StateID int  not null identity(1,1),
	State_Abbreviation Nvarchar(2) not null,
	State_Name Nvarchar(20) not null,
	salestax_percentage float not null,
	shipping float not null,
	Constraint StateFeePK Primary Key(StateID)
)

create table Dog_House_Catalog(
	DogHouseID int not null identity(1,1),
	Description nvarchar(20) not null,
	Width nvarchar(4) not null,
	Length nvarchar(4) not null,
	Height nvarchar(4) not null,
	Quanity_on_hand int not null,
	Unit_Price float not null,
	Constraint Dog_House_CatalogPK Primary Key(DogHouseID),
)

create table Orders(
	OrderID int not null identity(1,1),
	CustomerID int not null,
	StateID int not null ,
	order_date nvarchar(15) not null,
	delivery_address nvarchar(100) null,
	is_active bit not null,
	payment_method nvarchar(5) not null,
	Constraint OrderPK Primary Key(OrderID),
	Constraint OrderFK1 foreign key(CustomerID) references Customer(CustomerID)
	on delete no action on update no action,
	Constraint OrderFK2 foreign key(StateID) references StateFees(StateID)
	on delete no action on update no action
)
create table OrderDetail(
	OrderID int not null ,
	Item nvarchar(6) not null,
	DoghouseID int not null ,
	Quanity int not null,
	Constraint OrderDetailPK Primary Key(OrderID, Item, DoghouseID),
	Constraint OrderDetailFK foreign key(OrderID) references Orders(OrderID)
	on delete no action on update no action,
	Constraint OrderDetailFK2 foreign key(DogHouseID) references Dog_House_Catalog(DogHouseID)
		on delete no action on update no action,
)


--------------------------------------------------------------------------


create table Supplier_PersonalInfo(
	SupplierID int  not null identity(1,1),
	firstName nvarchar(50) not null,
	lastname nvarchar(50) not null,
	Constraint SupplierPK Primary Key(SupplierID)
)
create table Supplier_Information(
	SupplierID int  not null,
	Company_Name nvarchar(50) not null,
	Phone_Number nvarchar(50) not null,
	Phone_Type VARCHAR(50) not null,
	Active bit  not null ,
	Constraint Supplier_PhonePK Primary Key(SupplierID,Company_Name,Phone_Number),
	Constraint Supplier_PhoneFK foreign key(SupplierID) references Supplier_PersonalInfo(SupplierID)
	on delete no action on update no action
)

create table Raw_Material(
	Material_ID int  not null identity(1,1),
	SupplierID int  not null,
	Material_Name nvarchar(50) not null,
	Description nvarchar(10) not null,
	Measurements nvarchar(15) not null,
	Quanity_On_Hand int not null,
	Constraint RawMaterialPK Primary Key(Material_ID),
	Constraint Raw_MaterialFK foreign key(SupplierID) references Supplier_PersonalInfo(SupplierID)
	on delete no action on update no action
)

create table DogH_Material_Requirment(
	DogHouseID int not null,
	Material_ID int not null,
	Item nvarchar(6)not null,
	material_Quanity int not null,
	Constraint Bill_OM_PK Primary Key(DogHouseID, Material_ID),
	Constraint Bill_OM_FK2 foreign key(Material_ID) references Raw_Material(Material_ID)
		on delete no action on update no action,
	Constraint Bill_OM_FK3 foreign key(DogHouseID) references Dog_House_Catalog(DogHouseID)
		on delete no action on update no action
)