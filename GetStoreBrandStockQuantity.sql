CREATE PROCEDURE GetStoreBrandStockQuantity @BrandName VARCHAR(255) AS
BEGIN
	SELECT S.store_name, SUM(T.quantity) AS StockAmt
	FROM sales.stores S
	JOIN production.stocks T ON S.store_id = T.store_id
	JOIN production.products P ON T.product_id = P.product_id
	JOIN production.brands B ON P.brand_id = B.brand_id
	WHERE B.brand_name = @BrandName
	GROUP BY S.store_name
	ORDER BY S.store_name
END