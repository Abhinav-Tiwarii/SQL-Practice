use [AdventureWorks2019]

select * from [Person].[Person];
select * from [HumanResources].[Employee]
select * from [HumanResources].[EmployeePayHistory]


select p.FirstName , p.LastName , h.JobTitle ,hp.Rate, 
AverageRate = avg(hp.Rate) over(), 
MaximumRate = max(hp.Rate) over(),
DiffFromAvgRate = (hp.Rate - avg(hp.Rate) over()),
PercentofMaxRate = hp.Rate/max(hp.Rate) over() * 100
from Person.Person p join HumanResources.Employee h 
on p.BusinessEntityID = h.BusinessEntityID
join HumanResources.EmployeePayHistory hp
on h.BusinessEntityID = hp.BusinessEntityID;



SELECT 
 B.FirstName,B.LastName,C.JobTitle,A.Rate,
 AverageRate = AVG(A.Rate) OVER()
FROM AdventureWorks2019.HumanResources.EmployeePayHistory A
	JOIN AdventureWorks2019.Person.Person B
		ON A.BusinessEntityID = B.BusinessEntityID
	JOIN AdventureWorks2019.HumanResources.Employee C
		ON A.BusinessEntityID = C.BusinessEntityID