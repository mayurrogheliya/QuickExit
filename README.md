# QuickExit

## Overview
**QuickExit** is a Flutter-based mobile application designed to digitize and streamline the gatepass system for campus hostelers, guards, rectors, and visitors. The app offers a seamless and user-friendly experience to manage gatepass requests, approvals, and tracking, eliminating manual paperwork and enabling real-time updates.

## Features
- **Student Gatepass Request**: Students can easily request a gatepass for intra-day or extended leave by providing destination, reason, and exit date.
- **Visitor Management**: Guards can register visitors, log entry details, and manage visitor gatepass approvals.
- **Guard Functionality**: Guards can issue gatepasses directly for intra-day leave, approve/reject gatepass requests, and track the entry/exit of students and visitors.
- **Rector Functionality**: Rectors manage and issue extended leave requests, approve/reject requests, and track student gatepass history.
- **Real-Time Updates**: Integrated with Firebase, allowing all users to receive real-time status updates and manage gatepass requests efficiently.
- **History Tracking**: Students, guards, and rectors can view a detailed history of past gatepass requests and their status (approved/completed).

## Screens
### Student Screens:
1. **Request Gatepass**: Students can request intra-day or extended leave.
2. **History**: View all submitted requests and their current status (Pending, Approved, Completed).
3. **Profile**: View and update personal information.

### Guard Screens:
1. **Issue Gatepass**: Guards can directly issue gatepasses for students (intra-day leave only) and visitors.
2. **Requests**: View and manage gatepass requests sent by students for intra-day leave.
3. **History**: Track all students outside campus with options to call them or mark their return (Complete action). Also track visitors currently on campus with similar actions.

### Rector Screens:
1. **Issue Gatepass**: Rectors can issue gatepasses for students (extended leave only).
2. **Requests**: Manage extended leave requests sent by students.
3. **History**: Track students outside campus and manage communication via the call button or update their status when they return.

## Application Flow
1. **Login**: Students log in using their Enrollment Number and password, while employees (Guards and Rectors) log in using their Employee ID and password provided by the university.
2. **Gatepass Request (Student)**: 
   - For intra-day leave, the student submits a request which is sent to the guard for approval.
   - The student can also approach the guard directly to issue a gatepass.
   - Once approved, the student's information is recorded in the guard's history section. 
   - When the student returns, the guard marks the request as "Complete," signifying the student’s re-entry. The guard can contact the student via a call button if needed.
   - For extended leave, the request is sent to the rector, who manages approval instead of the guard.
3. **Visitor Entry**: Visitors contact the guard for a gatepass upon entry. The guard records their information and issues the pass. When the visitor exits, the guard marks the request as "Complete," or contacts the visitor using the call button if necessary.

## Firebase Integration
- **Firebase Firestore**: Used to store and manage collections for students, employees, and requests.
  - **Students Collection**: Stores student details such as First Name, Last Name, Enrollment Number, etc.
  - **Requests Collection**: Manages gatepass requests with status updates (Pending, Approved, Completed).
  - **Visitor Requests Collection**: Manages visitor entry and exit details.
- **Firebase Authentication**: Handles user login and validation.
- **SharedPreferences**: Used to store locally required user data for quick access.

## Technologies Used
- **Flutter**: Frontend framework for building cross-platform mobile applications.
- **Firebase Firestore**: NoSQL database for real-time data management.
- **Firebase Authentication**: For login and user authentication.
- **SharedPreferences**: To store local data on the user's device.


## Technologies Used
- **Flutter**: The frontend framework for building cross-platform mobile applications.
- **Firebase Firestore**: The NoSQL database for real-time data management.
- **Firebase Authentication**: Handles user login and authentication.
- **SharedPreferences**: For storing local data on the device.

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/mayurrogheliya/QuickExit
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Set up Firebase by adding your project configuration files (`google-services.json` for Android).
4. Run the project:
   ```bash
   flutter run
   ```

## Demo

You can watch the [QuickExit Demo Video here](https://youtu.be/IeBV-73WEWU).


## Contributors
- **Dhruv Burada** 
- **Paul Lawrence** 
- **Mayur Rogheliya** 

---

This project is part of a campus initiative to digitize and streamline gatepass management, created by **Dhruv Burada**, **Paul Lawrence**, and **Mayur Rogheliya**.