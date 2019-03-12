# CST438 PROJECT
Project By: Jake McGhee, Pavlos Papadonikolakis, Maco Doussias

Title:       Expense Tracker

Description: This is a CSUMB student project for an expense tracker program.
This is also managed through PivotalTracker: https://www.pivotaltracker.com/n/projects/2318433




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


Project Requirements:
- Users can log in and sign out of the application
- Users can record information about their daily expenses
- Users can edit their expense records
- Users can delete their expense records
- Users can view a monthly report of their spending habits
- Users can view records of all their expenses (by date)
- Users can view records of all their expenses (by category)
- Users should not be able to enter, edit, or delete expense records for other users
- Internet support (web app)
- Mobile support (native android app)
