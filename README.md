# 📄 Awraq

> **Awraq** is a smart Flutter mobile application designed to simplify Egyptian government procedures by helping users discover required documents, service locations, fees, notes, and AI-powered guidance — all in one place.

[![Flutter](https://img.shields.io/badge/Flutter-Framework-02569B?logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-Language-0175C2?logo=dart&logoColor=white)](https://dart.dev/)
[![BLoC](https://img.shields.io/badge/State%20Management-BLoC%2FCubit-blue)](https://bloclibrary.dev/)


<img width="1451" height="814" alt="image" src="https://github.com/user-attachments/assets/72c44eb6-ec1a-4cee-b0ed-0087c5c13766" />

---

## 🌟 Overview

**Awraq** is a mobile solution built to make completing common government procedures in Egypt easier and less time-consuming.

Instead of searching across multiple sources for documents, service locations, fees, and procedure requirements, users can find the information they need through a single application.

The application also provides an **AI-powered chatbot** for users who have questions or special cases that may require additional guidance.

### Government Procedures Covered

- 🪪 National ID creation or renewal
- 🪪 National ID replacement
- 🚗 Car license issuance or renewal
- 🛂 Passport issuance or renewal
- 📜 Birth certificate extraction

---

## 🎯 Key Objectives

- ⏱️ Reduce the time required to search for government procedure information
- 📋 Clearly show required documents and procedure requirements
- 📍 Help users find relevant service locations
- 🤖 Provide AI-powered assistance for questions and special cases
- ⭐ Allow users to save procedures for quick access
- 📝 Let users share notes and feedback about service locations
- 🔔 Keep users informed through notifications and procedure updates
- 🌐 Support Arabic and English search flows where applicable

---

## 👥 User Roles

Awraq is designed around two main system roles:

### 👤 User

Users can:

- Create an account
- Verify their email
- Login using email and password
- Login with Google
- Reset their password
- Manage their profile
- Search for government procedures
- Filter and sort procedures
- View complete procedure details
- Save procedures
- Remove saved procedures
- Ask the AI chatbot questions
- Receive AI recommendations
- Search for service locations
- View location details
- Open locations on maps
- Find nearby locations
- Add, edit, delete, and report notes
- Receive notifications and procedure updates

### 🛡️ Administrator

Administrators can:

- Manage user accounts
- Manage procedure information
- Manage procedure requirements
- Manage service locations
- Moderate notes and feedback
- View analytics through the administration dashboard

---

# ✨ Features

## 🔐 Authentication

- User Registration
- Email OTP Verification
- Login with Email & Password
- Google Login
- Password Reset
- Secure Authentication
- Logout

---

## 🔎 Procedure Discovery

Users can easily discover government procedures through:

- 🔍 Search
- 🔽 Filtering
- ↕️ Sorting
- 📋 Structured procedure information

Each procedure provides information about:

- Required documents
- Service locations
- Fees and additional charges when available
- Important notes
- AI recommendations

---

## ⭐ Saved Procedures

Users can:

- Save procedures for future reference
- View saved procedures
- Remove saved procedures

---

## 🤖 AI Chatbot

Awraq includes an AI-powered chatbot that helps users:

- Understand procedure requirements
- Ask questions about required documents
- Get guidance for special cases
- Receive AI-based recommendations

---

## 📍 Service Locations

Users can:

- Search for service locations
- View location details
- Open locations on maps
- Find nearby locations using GPS
- View notes and feedback about locations

---

## 📝 Notes & Feedback

Users can share their experience with service locations.

They can:

- Add notes
- View notes
- Edit notes
- Delete notes
- Report inappropriate notes

---

## 🔔 Notifications

The application supports:

- Procedure updates
- Important alerts
- Announcements
- Account-related notifications

---

# 🏗️ Architecture

The application follows a **Feature-First Architecture** to keep the project organized, scalable, and easy to maintain.

```text
lib/
│
├── core/
│   └── Shared application infrastructure
│
├── features/
│   ├── ai_chat/
│   ├── auth/
│   ├── edit_profile/
│   ├── governates/
│   ├── home/
│   ├── layout/
│   ├── localization/
│   ├── location_details/
│   ├── notification/
│   ├── notification_settings/
│   ├── onboarding/
│   ├── procedure_details/
│   ├── profile/
│   ├── saved/
│   ├── search/
│   ├── settings/
│   └── splash/
│
├── generated/
├── l10n/
└── main.dart
