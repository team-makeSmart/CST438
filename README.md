CST438 PROJECT
Student Project

Project By: Jake McGhee, Pavlos Papadonikolakis, Maco Doussias

Title: Expense Tracker

Description: This is a CSUMB student project for an expense tracker program.
This program will allow a user to input data into a database regarding their personal expenses. They will then be able to view, edit, remove, and change the data they have entered. The program will serve to track and categorize the user's expenses, as well as display pertinent information regarding their data.
This project will be a software tool developed in an agile working in environement with three teammates.
The technologies to implement the program will be Javascript, an HTTP server, a database of some kind, Ruby and more to be determined.

PivotalTracker for Agile Management of Project: https://www.pivotaltracker.com/n/projects/2318433

Github Repository for Project:
https://github.com/team-makeSmart/CST438

Docs Folder:
Contains all miscellaneous files for project.

Below are the primary fields of the Database:

CREATE TABLE user ( user_id INT AUTO_INCREMENT PRIMARY KEY, username VARCHAR(50) );

CREATE TABLE expense ( expense_id INT AUTO_INCREMENT PRIMARY KEY, user_id INT NOT NULL, amount INT NOT NULL, category VARCHAR(50) NOT NULL, description VARCHAR(255) );

Initial Project Requirements:

    Users can log in and sign out of the application (User Authentication)
    Users can record information about their daily expenses
    Users can edit their expense records
    Users can delete their expense records
    Users can view a monthly report of their spending habits
    Users can view records of all their expenses (by date)
    Users can view records of all their expenses (by category)
    Users should not be able to enter, edit, or delete expense records for other users (User Authorization)
    Internet support (web app)
    Mobile support (native android app)
