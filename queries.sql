use ecommerce;
-- queries do exercicio pedido 
-- Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações; 
-- Pagamento – Pode ter cadastrado mais de uma forma de pagamento;
-- Entrega – Possui status e código de rastreio;


-- Quantos pedidos foram feitos por cada cliente? 
show tables;
select * from clients; -- fname, lname
select * from orders; -- idOrder, idOrderClient, idPayment
 
select Fname, count(*) as total_orders from clients c
inner join orders o on c.idClient = idOrderClient
 group by c.idClient, Fname;

-- Algum vendedor também é fornecedor?

select  * from seller; -- idSeller -- cpf ou cnpj
select * from supplier; -- idSupplier , cnpj 
select * from seller se , supplier sup where se.CNPJ = sup.CNPJ; -- por cnpj 

-- Relação de produtos fornecedores e estoques;

select * from supplier; -- idSupplier , cnpj 
select * from product; -- idProduct 
select * from productStorage; -- idProdStorage 
select * from productSupplier;


select * from product p inner join productStorage ps on  p.IdProduct = ps.idProdStorage -- id do produto tem que ser igual ao id do estoque
inner join productSupplier psup on p.Idproduct  =  psup.idPsproduct
inner join supplier sup  on psup.idPsSupplier = sup.idSupplier;
show tables;


-- Relação de nomes dos fornecedores e nomes dos produtos;
select * from supplier; -- socialName
select * from product;

select sup.socialName, p.Pname from supplier sup
join productSupplier ps on sup.idSupplier = ps.idPsSupplier
join product p on ps.idPsProduct = p.idProduct;

 -- Listagem do nome de todos os produtos cadastrados na tabela product
 select Pname from product;
 
 -- Mostrar o nome social e o cnpj fornecedores da tabela supplier
 
 select socialName as name_supplier, CNPJ, contact from supplier
 order by socialName;
 
 -- Exibir nome e categoria dos produtos.
 select Pname, category from product;
 
 -- Endereço de um cliente.
 select * from clients; -- Fname, Address
 select * from clients
 where Address = 'rua silva de prata 29, carangola - cidade das flores';
 
  -- Produtos que são do estado "SP".
select Pname, storageLocation
from product p
join productStorage ps
on p.idProduct = ps.idProdStorage
where ps.storageLocation = 'São Paulo';

-- Mostrando o produto e um novo campo com o preço com 10% de desconto.

select sendValue as preco_original,
(sendValue * 0.10) as preco_com_desconto
from orders;