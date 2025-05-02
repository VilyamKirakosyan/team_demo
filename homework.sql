-- First Task:

CREATE TABLE users (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    address VARCHAR(255),
    email VARCHAR(150) UNIQUE
);
CREATE TABLE products (
    product_id UUID PRIMARY KEY,
    product_name VARCHAR(100),
    description TEXT,
    price INT CHECK (price >= 0)
);
CREATE TABLE orders (
    order_id UUID PRIMARY KEY,
    user UUID NOT NULL,
    product_ordered UUID NOT NULL,
    total_paid INT CHECK (total_paid >= 0),
    FOREIGN KEY (user) REFERENCES users(user_id),
    FOREIGN KEY (product_ordered) REFERENCES products(product_id)
);
SELECT 
    o.order_id,
    u.first_name || ' ' || u.last_name AS customer_name,
    p.product_name,
    o.total_paid
FROM orders o
JOIN users u ON o.user = u.user_id
JOIN products p ON o.product_ordered = p.product_id;

-- End of First Task:
-- --------------------------------------------------:
-- Second Task:

CREATE TABLE country (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
CREATE TABLE department (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
CREATE TABLE job_title (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description INT
);
CREATE TABLE employee (
    id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    job_title_id INT,
    department_id INT,
    country_id INT,
    FOREIGN KEY (job_title_id) REFERENCES job_title(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

-- v1:

SELECT 
    e.id AS employee_id,
    e.first_name,
    e.last_name,
    e.start_date,
    e.end_date,
    jt.name AS job_title,
    d.name AS department,
    c.name AS country
FROM employee e
LEFT JOIN job_title jt ON e.job_title_id = jt.id
LEFT JOIN department d ON e.department_id = d.id
LEFT JOIN country c ON e.country_id = c.id;

-- v2:

SELECT 
    e.first_name,
    e.last_name,
    d.name AS department
FROM employee e
INNER JOIN department d ON e.department_id = d.id
WHERE d.name = 'Finance';

-- v3 :


SELECT 
    d.name AS department,
    jt.name AS job_title,
    COUNT(e.id) AS employee_count
FROM employee e
JOIN department d ON e.department_id = d.id
JOIN job_title jt ON e.job_title_id = jt.id
GROUP BY d.name, jt.name
ORDER BY employee_count DESC;

-- End of Second Task:
-- --------------------------------------------------:
-- Third Task:

CREATE TABLE User (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(100),
    Email VARCHAR(100),
    Password VARCHAR(100)
);

CREATE TABLE Post (
    PostID INT PRIMARY KEY,
    UserI INT,
    Conte TEXT,
    PostD DATE,
    FOREIGN KEY (UserI) REFERENCES User(UserID)
);


CREATE TABLE Comment (
    CommentID INT PRIMARY KEY,
    UserID INT,
    PostID INT,
    Content TEXT,
    CommentD DATE,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (PostID) REFERENCES Post(PostID)
);

CREATE TABLE LikePost (
    User INT,
    Post INT,
    Like DATE,
    PRIMARY KEY (User, Post),
    FOREIGN KEY (User) REFERENCES User(UserID),
    FOREIGN KEY (Post) REFERENCES Post(PostID)
);
CREATE TABLE LikeComment (
    UserID INT,
    Comment INT,
    LikeDate DATE,
    PRIMARY KEY (UserID, Comment),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (Comment) REFERENCES Comment(CommentID)
);

SELECT 
    p.PostID,
    u.UserName,
    p.Conte AS content,
    p.PostD AS post_date
FROM Post p
JOIN User u ON p.UserI = u.UserID;
________________________________________
SELECT 
    c.CommentID,
    p.PostID,
    u.UserName AS commenter,
    c.Content,
    c.CommentD
FROM Comment c
JOIN User u ON c.UserID = u.UserID
JOIN Post p ON c.PostID = p.PostID;
________________________________________
SELECT 
    lp.Post,
    u.UserName AS liked_by,
    lp.Like AS like_date
FROM LikePost lp
JOIN User u ON lp.User = u.UserID;
________________________________________
SELECT 
    lc.Comment,
    u.UserName AS liked_by,
    lc.LikeDate
FROM LikeComment lc
JOIN User u ON lc.UserID = u.UserID;
________________________________________
SELECT 
    c.CommentID,
    c.Content,
    COUNT(lc.UserID) AS like_count
FROM Comment c
LEFT JOIN LikeComment lc ON c.CommentID = lc.Comment
WHERE c.PostID = ?   -- Replace ? with a specific PostID
GROUP BY c.CommentID, c.Content;
________________________________________
SELECT 
    p.PostID,
    p.Conte,
    COUNT(lp.User) AS total_likes
FROM Post p
LEFT JOIN LikePost lp ON p.PostID = lp.Post
GROUP BY p.PostID, p.Conte;
________________________________________

SELECT 
    u.UserName,
    p.PostID,
    COUNT(DISTINCT c.CommentID) AS comment_count,
    COUNT(DISTINCT lp.User) AS like_count
FROM User u
JOIN Post p ON p.UserI = u.UserID
LEFT JOIN Comment c ON c.PostID = p.PostID
LEFT JOIN LikePost lp ON lp.Post = p.PostID
GROUP BY u.UserName, p.PostID;

-- End of Third Task:
-- --------------------------------------------------:
-- Fourth Task:

SELECT trip_no, date
FROM Trip
JOIN Pass_in_trip USING (trip_no)
WHERE town_from = 'Paris' AND town_to = 'London'
ORDER BY trip_no, date;
Passengers whose surname starts with "B"
Assuming the full name is stored as a single string:

SELECT *
FROM Passenger
WHERE SUBSTRING_INDEX(name, ' ', -1) LIKE 'B%';
Alternatively, if surname is the second word:

SELECT *
FROM Passenger
WHERE SUBSTRING(name, INSTR(name, ' ') + 1, 1) = 'B';
Number of passengers per flight per day

SELECT trip_no, date, COUNT(ID_psg) AS passenger_count
FROM Pass_in_trip
GROUP BY trip_no, date;
Passengers who traveled more than 2 times

SELECT ID_psg, COUNT(*) AS num_trips
FROM Pass_in_trip
GROUP BY ID_psg
HAVING num_trips > 2;
Flight directions for each company


SELECT Company.name, Trip.town_from, Trip.town_to
FROM Trip
JOIN Company ON Trip.ID_comp = Company.ID_comp
GROUP BY Company.name, town_from, town_to;
Passengers traveling same direction on different dates > 2 times

SELECT ID_psg, town_from, town_to, COUNT(DISTINCT date) AS trip_dates
FROM Pass_in_trip pit
JOIN Trip t ON pit.trip_no = t.trip_no
GROUP BY ID_psg, town_from, town_to
HAVING trip_dates > 2;




