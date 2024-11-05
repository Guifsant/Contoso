USE AdventureWorksDW2022
CREATE OR ALTER VIEW Vendas_Internet AS
SELECT
	SalesOrderNumber AS 'ID da Compra',
	OrderDate AS 'Data da Compra',
	EnglishProductName AS 'Nome do Produto',
	EnglishProductCategoryName AS 'Categoria',
	CONCAT(FirstName, ' ', LastName) AS 'Nome do Cliente',
	Gender AS 'Gênero',
	SalesTerritoryCountry AS 'País',
	OrderQuantity AS 'Qtd Vendida',
	TotalProductCost AS 'Custo',
	SalesAmount 'Preço'
		FROM
			FactInternetSales
				INNER JOIN
					DimProduct
						ON
						FactInternetSales.ProductKey = DimProduct.ProductKey
				INNER JOIN
					DimProductSubcategory
						ON
						DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
				INNER JOIN
					DimProductCategory
						ON
						DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
				INNER JOIN
					DimCustomer
						ON
						FactInternetSales.CustomerKey = DimCustomer.CustomerKey
				INNER JOIN
					DimSalesTerritory
						ON
						FactInternetSales.SalesTerritoryKey = DimSalesTerritory.SalesTerritoryKey
							WHERE
								YEAR(OrderDate) BETWEEN 2011 AND 2013

--SELECT * FROM Vendas_Internet			
