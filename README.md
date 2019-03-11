# CST438 PROJECT
Project By: Jake McGhee, Pavlos Papadonikolakis, Maco Doussias

Title:       Expense Tracker

Description: This is a CSUMB student project for an expense tracker program.

Database Outline:

CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50)
);

CREATE TABLE expense (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    amount INT NOT NULL,
    category VARCHAR(50) NOT NULL,
    description VARCHAR(255)
);
