-- inserção de dados 
use ecommerce;

-- idClient, Fname, Minit, Lname, CPF, Address
insert into clients (Fname, Minit, Lname, CPF, Address)
values ('Maria','M','Silva',123456789, 'rua silva de prata 29, carangola - cidade das flores'),
        ('Matheus','O','Pimentel',987654321, 'rua almeida 289, centro - cidade dos rubis'),
        ('Ricardo','F','Brigagão',789654321, 'rua antonio carlos 290, centro - cidade das capivaras'),
        ('Joelma','S','Mirislam',840832609, 'rua da pedra 120, centro - cidade das goaiabas');

INSERT INTO clients(Fname, CPF, Address)
VALUES ('Ana','12345678901','Rua A');

insert into clients (Fname, Minit, Lname, CNPJ, Address)
values ('Marta','G','Alves', 12345678000190, 'rua lua de prata 290, maringa - cidade dos grilos');

ALTER TABLE clients 
MODIFY CPF CHAR(11) NULL;

desc clients;

select * from clients;
desc product;
insert into product (Pname, classification_kids, category, avaliação, size)
values('Fone de ouvido',false,'Eletrônico','4',null),
      ('Barbie',true,'Brinquedos','3',null),
      ('Vestido',false,'vestimenta',5,null),
      ('Microfone Vedo - Youtuber',false,'Eletrônico','2',null);
     --  ('Sofá retrátil',false,'Móveis','3','3x57x80');
      -- delete from product where idProduct = 9;
      desc product;
     
      select * from product;

      select * from productOrder;
      
insert into productOrder(idPOproduct, idPOorder, poQuantity, poStatus)
values
(1,9,2,null),
(2,10,1,null),
(3,11,1,null),
(4,12,1,null);
select idOrder from orders;

select * from payments;
desc payments;

insert into payments (idClient, typePayment, limitAvailable) 
values (1, 'Boleto', 1000),
       (2, 'cartão', 1500),
	   (3, 'Dois cartões', 2000),
       (4, 'Boleto', 3000);

select * from orders;
desc productOrder;
desc orders;

-- delete from orders where idOrderClient (1,2,3,1);
insert into orders(idOrderClient, idPayment, orderStatus, orderDescription, sendValue) values
(1,1,default, 'Compra via aplicativo', null),
(2,2,default, 'Compra via aplicativo', 50),
(3,3,'confirmado', null, null),
(4,4,default, 'Compra via web site', 150);
select * from orders;
desc orders;

insert into productStorage (storageLocation, quantity) values
('Rio de janeiro', 1000),
('Rio de janeiro', 500),
('São Paulo', 10),
('São Paulo', 100),
('São Paulo', 10),
('Brasília', 60);

select * from product;
select * from productStorage;

insert into storageLocation (idLproduct, idLstorage, location) values 
(1,1,'RJ'),
(2,2,'GO'),
(3,3,'GO'),
(4,4,'GO');
select * from storageLocation;
insert into supplier(socialName, CNPJ, contact)
values ('Almeida e filhos', 123456789123456, '21985474'),
       ('Eletrônicos Silva', 321456789123456, '21985484'),
	   ('Eletrônicos Valma ', 908765432112345, '21975984');
select * from supplier;

insert into productSupplier(idPsSupplier, idPsProduct, quantity) values
(1,1,500),
(2,2,400),
(3,3,633);

insert into seller(socialName, sellerLocation, CNPJ, CPF, location, contact) values
('Tech eletronics', null,123456789321456, null, 'Rio de Janeiro', 213456789),
('Botique Durgas',null, null, '123432456', 'Rio de Janeiro', '213556387'),
('Kids World', null, 345678123456789, null, 'São Paulo', '119856377');
desc seller;
alter table seller modify sellerLocation varchar(255) null; -- colocar coluna nula

select * from seller;

insert into productSeller(idPseller, idPproduct, prodQuantity) values
(1,1,80),
(2,2,10);  
       select * from product;
desc productSeller;


show tables;
desc storageLocation;

 delete from product where idProduct = 13;
-- queries da aula
select count(*) from clients;
select * from clients c, orders o where c.idClient = idOrderClient;
select Fname, Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;
select concat(Fname, ' ',Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;

insert into orders(idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
(2,default, 'Compra via aplicativo', null, 1);

select * from clients c, orders o
where c.idClient = idOrderClient;
select * from orders;
select * from clients inner join orders on idClient = o.idOrderClient
inner join productOrder p on p.idPOorder = o.idOrder;