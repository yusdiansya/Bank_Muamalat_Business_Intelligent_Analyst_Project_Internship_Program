SELECT
    o.tanggal AS order_date,
    pc.CategoryName AS category_name,
    p.ProdName AS product_name,
    p.Price AS product_price,
    o.Quantity AS order_qty,
    SUM(p.Price * o.Quantity) AS total_sales,
    c.CustomerEmail AS cust_email,
    c.CustomerCity AS cust_city
FROM
    penjualan o
    JOIN pelanggan c ON o.CustomerID = c.CustomerID
    JOIN produk p ON o.ProdNumber = p.ProdNumber
    JOIN kategori_produk pc ON p.Category = pc.CategoryID
GROUP BY
    o.tanggal,
    pc.CategoryName,
    p.ProdName,
    p.Price,
    o.Quantity,
    c.CustomerEmail,
    c.CustomerCity
ORDER BY
    o.tanggal ASC;