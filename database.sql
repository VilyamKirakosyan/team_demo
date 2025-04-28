CREATE SCHEMA Vilyam_HW;

CREATE TABLE Vilyam_HW.Company (
    CompanyName varchar(255),
    Industry varchar(255),
    Website varchar(255),
    Address varchar(255),
    Contact_Email varchar(255),
    Phone_Number varchar(20)
);

INSERT INTO Vilyam_HW.Company (CompanyName, Industry, Website, Address, Contact_Email, Phone_Number)
VALUES  ('TechWave Solutions', 'Technology', 'www.techwave.com', '123 Silicon Valley Blvd, San Jose, CA 95129', 'contact@techwave.com', '+1 (408) 555-1212');

INSERT INTO Vilyam_HW.Company (CompanyName, Industry, Website, Address, Contact_Email, Phone_Number)
VALUES ('GreenLeaf Organics', 'Agriculture', 'www.greenleaforganics.co', '786 Greenway St, Austin, TX 78701', 'info@greenleaforganics.co', '+1 (512) 555-3456');

INSERT INTO Vilyam_HW.Company (CompanyName, Industry, Website, Address, Contact_Email, Phone_Number)
VALUES ('SkyHigh Aerospace', 'Aerospace', 'www.skyhighaero.com', '980 Flight Dr, Seattle, WA 98109', 'support@skyhighaero.com', '+1 (206) 555-9876');

INSERT INTO Vilyam_HW.Company (CompanyName, Industry, Website, Address, Contact_Email, Phone_Number)
VALUES ('Global Financial Group', 'Finance', 'www.globalfinancial.com', '455 Wall St, New York, NY 10005', 'inquiry@globalfinancial.com', '+1 (212) 555-2233');

INSERT INTO Vilyam_HW.Company (CompanyName, Industry, Website, Address, Contact_Email, Phone_Number)
VALUES ('BrightPath Education', 'Education', 'www.brightpathedu.org', '67 Scholar Ave, Boston, MA 02118', 'admissions@brightpathedu.org', '+1 (617) 555-8901');

SELECT * FROM Vilyam_HW.Company;

DROP TABLE Vilyam_HW.Company;