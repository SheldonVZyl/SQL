-- try it yourself chapter1
CREATE TABLE animals
(
	id bigserial,
	type varchar(50),
	gender varchar(50),
	age integer
);

INSERT INTO animals (type, gender, age)
VALUES
	('Tiger', 'Female', 1),
	('Lion', 'Male', 3);