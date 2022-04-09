/* Projeto 
A FINALIDADE DO PROJETO � MOSTRAR UMA CONSULTA MAIS ESTRUTURADA NA OBTEN��O DOS DADOS NO SERVIDOR.
USANDO SELECT'S PARA OBTER DE FORMA SIMPLES A INFORMA��O DE CADA TABELA E DEPOIS AGRUPA-LAS COM INNER JOIN
AS INFORMA��ES NECESSARIAS.
*/ 
Use AdventureWorks2019

Select top 200 * from [Person].[Person]
Select top 200 * from [Person].[EmailAddress]
Select top 200 * from [Production].[Product]
Select top 200 * from [Sales].[SalesOrderDetail]
Select top 200 * from [Sales].[CreditCard]

Select distinct top 200 FirstName, LastName
from person.Person 

Select top 200 EmailAddress from [Person].[EmailAddress] order by EmailAddress asc

select top 200 a.BusinessEntityID as 'IDNeg�cio', a.FirstName 'Nome', a.LastName 'Sobrenome', b.EmailAddress as 'Email'
from person.Person a
inner join person.EmailAddress b on a.BusinessEntityID = b.BusinessEntityID order by EmailAddress asc


Select distinct top 200  ProductID, Name, SafetyStockLevel
from [Production].[Product]

Select top 200 UnitPrice, count(distinct ProductID) as 'IDProduto'
from [Sales].[SalesOrderDetail] group by UnitPrice having min(UnitPrice) < '200.000' 

Select top 200 CardNumber, CardType  from [Sales].[CreditCard] 

select distinct top 200 a.ProductID, a.Name as 'Nome', a.SafetyStockLevel as 'Estoque Livre', b.OrderQty as 'Quantidade', b.UnitPrice as 'Pre�o Unitario', c.CardNumber as 'N.Cart�o'
from production.Product a 
inner join sales.SalesOrderDetail b on b.SalesOrderDetailID = a.ProductID
inner join sales.CreditCard c on c.CreditCardID = a.ProductID

/*JUN��O DE TODAS AS TABELAS*/

select distinct top 2000 a.ProductID, a.Name as 'Nome Do Produto', a.SafetyStockLevel as 'Estoque Livre', b.OrderQty as 'Quantidade', b.UnitPrice as 'Pre�o Unitario', 
c.CardNumber as 'N.Cart�o', d.BusinessEntityID as 'IDNeg�cio', d.FirstName 'Nome', d.LastName 'Sobrenome', e.EmailAddress as 'Email'
from production.Product a 
inner join sales.SalesOrderDetail b on b.SalesOrderDetailID = a.ProductID
inner join sales.CreditCard c on c.CreditCardID = a.ProductID
inner join person.Person d on d.BusinessEntityID = a.ProductID
inner join person.EmailAddress e on e.BusinessEntityID = a.ProductID
