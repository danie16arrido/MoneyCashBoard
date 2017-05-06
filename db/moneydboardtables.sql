DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS incomes;


DROP TABLE IF EXISTS transfers;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS mastercategories;

CREATE TABLE users(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  dob DATE,
  over_budget BOOL
);

CREATE TABLE mastercategories(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE categories(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  master_category_id INT4 REFERENCES mastercategories(id)
);

CREATE TABLE transfers(
  id SERIAL4 PRIMARY KEY,
  amount NUMERIC(8,2),
  op_date DATE,
  op_time TIME,
  user_id INT4 REFERENCES users(id),
  category_id INT4 REFERENCES categories(id)
);

CREATE TABLE incomes(
  id SERIAL4 PRIMARY KEY,
  amount NUMERIC(8,2),
  op_date DATE,
  op_time TIME,
  provider VARCHAR(255),
  user_id INT4 REFERENCES users(id)
);

CREATE TABLE loans(
  id SERIAL4 PRIMARY KEY,
  amount NUMERIC(8,2),
  op_date DATE,
  op_time TIME,
  provider VARCHAR(255),
  user_id INT4 REFERENCES users(id),
  is_payed BOOL
);
