CREATE TABLE IF NOT EXISTS Homework.company(
CompanyName Varchar (200),
Industry Varchar (100),
Website Varchar (200),
Address Varchar (200),
ContactEmail Varchar (200),
PhoneNumber Varchar (50)
);
SELECT *FROM homework.company;
INSERT INTO homework.company(
CompanyName,
Industry,
Website,
Address,
ContactEmail,
PhoneNumber)VALUES
('TechWave Solutions','Technology','www.techwave.com','123 Silicon Valley Blvd San Jose CA 95129','contact@techwave.com','+1 (408) 555-1212'),
('GreenLeaf Organics','Agriculture','www.greenleaforganics.co','786 Greenway St Austin TX 78701','info@greenleaforganics.co','+1 (512) 555-3456'),
('SkyHigh Aerospace','Aerospace','www.skyhighaero.com','980 Flight Dr Seattle WA 98109','support@skyhighaero.com','+1 (206) 555-9876'),
('Global Financial Group','Finance','www.globalfinancial.com','455 Wall St New York NY 10005','inquiry@globalfinancial.com','+1 (212) 555-2233');
Select *FROM homework.company;
Select CompanyName,Address, PhoneNumber FROM homework.company;
Select *FROM homework.company 
Where ContactEmail='info@greenleaforganics.co';
SET SQL_SAFE_UPDATES = 0;

DELETE FROM homework.company  
WHERE CompanyName = 'GreenLeaf Organics';

SET SQL_SAFE_UPDATES = 1;
Select *FROM homework.company;
DELETE FROM homework.company ; 
SET SQL_SAFE_UPDATES = 0;
DELETE FROM homework.company;
