# Interview Preparation App:

A full-featured Flutter mobile application designed to help job seekers prepare for interviews with categorized HR, Technical, and Aptitude questions.
Each question is marked with a difficulty level — Easy, Medium, or Hard — to help candidates focus their preparation.
Includes a secure Admin Panel for manually adding new questions.
The app uses SharedPreferences for lightweight, fast, and offline-capable data storage, making it fully functional without internet access.

## Table of Contents:

1.Features
2.Tech Stack
3.Installation
4.Admin Panel
5.Future Improvements
6.License
7.Author

## Features:
1.Question Categories: HR, Technical, Aptitude
2.Difficulty Levels: Easy, Medium, Hard
3.Admin Panel: Separate page for manually adding, editing, or deleting questions
4.Offline Data Storage: Persistent storage with SharedPreferences
5.Responsive UI for different devices
6.Lightweight and fast performance

## Tech Stack:

Frontend: Flutter (Dart)
Local Storage: SharedPreferences
State Management: setState (or Provider if implemented)
Platforms: Android & iOS

## Installation:


### Clone the repository:
git clone https://github.com/parthadhara19/interview_prep_app.git
cd interview_prep_app

### Install dependencies:
flutter pub get

### Run the app:
flutter run

## Admin Panel:

Accessed through a separate login page
Credentials are currently set in the source code
### Allows admins to:
Manually add new questions
Edit existing questions
Remove outdated questions

## Future Improvements:

Firebase or SQLite integration for cloud data storage
User authentication system
Search and filter functionality
Bookmark and favorite questions
Export questions as PDF

## License:
This project is licensed under the MIT License — you are free to use, modify, and distribute it.

## Author:
Partha Dhara
GitHub: https://github.com/parthadhara19
