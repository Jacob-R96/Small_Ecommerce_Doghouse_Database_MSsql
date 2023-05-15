Create View V_Customer_Receipts as
Select OrderID, CustomerID , o.StateID, payment_method,
dbo.F_StateTax(dbo.F_SubTotal(OrderID),s.StateID) as State_Tax, s.shipping as Shipping , dbo.F_SubTotal(OrderID) as SubTotal, dbo.F_FinalTotal(dbo.F_SubTotal(OrderID),s.StateID)  as Final_Total
FROM Orders o 
JOIN StateFees s ON s.StateID = o.StateID;


Create view V_CustomerID_1_Activity as
	Select * from  dbo.F_CustomerActivity(1) 


Create view V_Subtotal_OrderID_1 as 
	Select CustomerID, OrderID,  dbo.F_SubTotal(1) as Subtotal
	from Orders where OrderID=1

Create view V_Monthly_Sales as 
	Select Month(order_date) as Month, Sum(dbo.F_FinalTotal(dbo.F_SubTotal(OrderID),StateID)) as Monthly_Total  from Orders
Group by  Month(order_date)


Create view V_Each_DogHouse_Sales as 
	Select D.DogHouseID, D.Description,  Sum(D.Unit_Price * O.Quanity) as Total_Sales  
	from Dog_House_Catalog D
			JOIN OrderDetail O ON D.DogHouseID = O.DogHouseID
						Group by  D.DogHouseID, D.Description




Create function F_CustomerActivity(@ID int)
returns table
as
return
Select CustomerID, order_date, dbo.F_FinalTotal(dbo.F_SubTotal(OrderID),StateID) as Money_Spent
from Orders
where CustomerID = @ID


CREATE FUNCTION F_SubTotal(@ID int)
RETURNS float
BEGIN
  DECLARE @total_sales float;
	SELECT @total_sales = SUM(s.Quanity * p.unit_price)
  FROM OrderDetail s
  JOIN Dog_House_Catalog p  ON s.DoghouseID = p.DoghouseID
  WHERE OrderID = @ID
  RETURN @total_sales;
END;

CREATE FUNCTION F_StateTax(@Total float, @StateID int)
RETURNS float
BEGIN
  DECLARE @total_Fee float;
	SELECT @total_Fee = (salestax_percentage * @Total)
  FROM StateFees
  where StateID = @StateID
  RETURN @total_Fee;
END;

CREATE FUNCTION F_FinalTotal(@Total float, @StateID int)
RETURNS float
BEGIN
  DECLARE @total_Fee float;
    
	SELECT @total_Fee = ((salestax_percentage * @Total)+@Total + shipping)
  FROM StateFees
  where StateID = @StateID
  RETURN @total_Fee;
END;



select * from OrderDetail
select * from Dog_House_Catalog
SELECT * FROM Orders;
select * from StateFee
delete from Orders
delete from StateFee
delete from Orders
select * from Supplier_Information
drop table StateFee
drop table Orders