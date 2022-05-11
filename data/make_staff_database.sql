CREATE DATABASE webdata;
USE webdata;

CREATE TABLE staff
(
  staff_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  job_title VARCHAR(255),
  PRIMARY KEY (staff_id)
);

INSERT INTO staff VALUES (1, 'Mike Raffone', 'CEO/Executive Producer');
INSERT INTO staff VALUES (2, 'Tamara Knight', 'Executive Director');
INSERT INTO staff VALUES (3, 'Willie Waite', 'Director of Technology');
INSERT INTO staff VALUES (4, 'Candy Barr', 'Senior Programmer');
INSERT INTO staff VALUES (5, 'Barry Cade', 'Technical Officer');
INSERT INTO staff VALUES (6, 'Luke Warm', 'Director of Business Development');
INSERT INTO staff VALUES (7, 'Mona Lott', 'Business Development Officer');
INSERT INTO staff VALUES (8, 'Pepe Roni', 'Business Development Assistant');
INSERT INTO staff VALUES (9, 'Bea Minor', 'Director of Operations');
INSERT INTO staff VALUES (10, 'Howie Doohan', 'Customer Support Manager');
INSERT INTO staff VALUES (11, 'M. Balmer', 'Marketing Manager');
INSERT INTO staff VALUES (12, 'Joy Kil', 'Senior Game Tester');
INSERT INTO staff VALUES (13, 'Rusty Steele', 'Junior Game Tester');
INSERT INTO staff VALUES (14, 'Adam Zapel', 'Office Manager');
INSERT INTO staff VALUES (15, 'Rick Shaw', 'Office Assistant');
