use [AdventureWorks2019]

--select * from Production.Product;
--select * from Production.ProductSubcategory;


select p.Name as ProductName, p.ListPrice, ps.Name as ProductSubCategory, pc.Name as ProductCategory , 
AvgPriceByCategory = avg(p.listprice) over(),
AvgPriceByCategoryAndSubcategory = avg(p.listprice) over(partition by p.Name, ps.Name),
PriceRank = ROW_NUMBER() over(order by ListPrice desc),
[Category Price Rank] = ROW_NUMBER() over (partition by pc.Name Order by ListPrice desc),
[Top 5 Price In Category] = case when 
ROW_NUMBER() Over(Partition by pc.Name order by ListPrice Desc)<=5 then 'YES' 
else 'NO'
end
from Production.Product p join Production.ProductSubcategory ps
on p.ProductSubcategoryID = ps.ProductSubcategoryID 
join Production.ProductCategory pc;
on ps.ProductCategoryID = pc.ProductCategoryID;
