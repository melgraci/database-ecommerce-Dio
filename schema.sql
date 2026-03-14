create database ecommerce;
-- drop database ecommerce;
use ecommerce;

-- criar tabela cliente
desc clients;
create table clients(
idClient int auto_increment primary key,
Fname varchar(10),
Minit char(3),
Lname varchar(20),
CPF char (11) not null,
Address varchar(30), -- composto por rua, estado, complemento, cidade, bairro
constraint unique_cpf_client unique (CPF)
);        
alter table clients add  CNPJ char(14); 
ALTER TABLE clients ADD CONSTRAINT unique_cnpj_client UNIQUE (CNPJ);
ALTER TABLE clients ADD CONSTRAINT chk_tipo_cliente
CHECK (
 (CPF IS NOT NULL AND CNPJ IS NULL) OR
 (CPF IS NULL AND CNPJ IS NOT NULL)
);
--  table clients add constraint chk_contato CHECK (CPF is not null or CNPJ is not null);

alter table clients auto_increment = 1;
desc clients;
ALTER TABLE clients MODIFY Address varchar(255);

-- tabela produto -- size dimensao do produto
create table product(
idProduct int auto_increment primary key,
Pname varchar(10),
classification_kids bool default false,
category enum('Eletrônico', 'vestimenta', 'Brinquedos', 'Alimentos')not null,
avaliação float default 0,
size varchar (30)
); 
alter table product auto_increment = 1;
ALTER TABLE product MODIFY Pname varchar(30);


-- terminar no desafio
-- criar constraints relacionadas a pagamento
 -- o tipo do pagamento vai ser relacionado ao cliente
 create table payments( 
  idPayment int auto_increment primary key,
  idClient int,
  typePayment enum('Boleto', 'cartão', 'Dois cartões'),
  limitAvailable float,
  constraint fk_payments_clients foreign key(idClient) references clients(idClient) -- relação de qual pagamento o cliente fez.
  
);
-- alter table payments add constraint fk_clients_payments foreingn key(typePayment) references clients(idClient);
select  * from payments  fk_payments_clients;

-- criar tabela pedido 
create table orders(
idOrder int auto_increment primary key,
idOrderClient int,  
idPayment int,
orderStatus enum('cancelado', 'confirmado', 'Em processamento') default 'Em processamento',
orderDescription varchar(255),
sendValue float default 10,
constraint fk_orders_client foreign key (idOrderClient) references clients(idClient), 
constraint fk_orders_payment foreign key(idPayment) references payments(idPayment) 
);



alter table orders auto_increment = 1;

-- criar tabela estoque 
create table productStorage(
idProdStorage int auto_increment primary key,
storageLocation varchar(255),
quantity int default 0
);

alter table productStorage auto_increment = 1;

-- criar tabela fornecedor
create table supplier(
idSupplier int auto_increment primary key,
socialName varchar(255) not null,
CNPJ char(15) not null,
contact char(11) default 0 not null,
constraint unique_supplier unique (CNPJ)
);
alter table supplier auto_increment = 1;
-- criar tabela vendedor

create table seller(
idSeller int auto_increment primary key,
socialName varchar(255) not null,
sellerLocation char(15) not null,
CNPJ char(15),
CPF char(15),
location varchar(255),
contact char(11) default 0 not null,
constraint unique_cnpj_seller unique (CNPJ),
constraint unique_cpf_seller unique (CPF)
);
alter table seller auto_increment = 1;

create table productSeller(
idPseller int,
idPproduct int,
prodQuantity int default 1,
primary key (idPseller, idPproduct),
constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
constraint fk_product_product foreign key (idPproduct) references product(idProduct)

);

create table productOrder(
idPOproduct int,
idPOorder int,
poQuantity int default 1,
poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
primary key (idPOproduct, idPOorder),
constraint fk_productOrder_seller foreign key (idPOproduct) references product(idProduct),
constraint fk_productOrder_product foreign key (idPOorder) references orders(idOrder)

);
select * from storageLocation;
create table storageLocation(
idLproduct int,
idLstorage int,
location varchar(255) not null,
primary key (idLproduct, idLstorage),
constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)

);


create table productSupplier(
idPsSupplier int,
idPsproduct int,
quantity int not null,
primary key (idPsSupplier, idPsproduct),
constraint fk_product_sepplier foreign key (idPsSupplier) references supplier(idSupplier),
constraint fk_product_supplier_product foreign key (idPsproduct) references product(idProduct)

);

show tables;
select * from supplier;

use information_schema;

desc referential_constraints;

select * from referential_constraints;



