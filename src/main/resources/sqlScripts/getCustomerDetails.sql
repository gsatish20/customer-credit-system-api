select * from customer cust join 
Contact contact on contact.CustomerID = cust.customerId join
CreditScore credit on credit.CustomerID = cust.customerId join Loan
loan on loan.CustomerID = cust.customerId where cust.customerId =:customerId and cust.ssn =:ssn