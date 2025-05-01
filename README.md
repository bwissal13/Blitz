# 📦 Delivery Request Flutter App

A simple Flutter application that allows users to submit delivery requests, view the next available rider time, and check past requests. The app is built using clean architecture principles with clear separation of concerns (models, controllers, services, and UI widgets).

---

## 🚀 Features

- 🔁 Submit delivery requests with a phone number
- 🕒 See the estimated time of the next available rider
- 📜 View a list of past requests with ID, status, and total
- ✅ Success banner after submitting a request
- 💡 Clean and maintainable architecture with state management

---

## 🧱 Project Structure

```
lib/
│   main.dart
│
├───controllers
│       home_controller.dart
│
├───models
│       request.dart
│       rider.dart
│
├───screens
│   └───home
│       │   home_screen.dart
│       │
│       └───widgets
│               next_rider_card.dart
│               request_button.dart
│               request_dialog.dart
│               request_history_list.dart
│               success_banner.dart
│
└───services
        api_service.dart
```

---

## 🛠️ Dependencies

Add these to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.1
  http: ^0.13.6
```

---

## 🧪 How It Works

### Submit a Request

1. Enter your phone number.
2. Press the "Demander un livreur" button.
3. The app sends a POST request to your API.
4. A green success banner appears, and request history updates.

### See Past Requests

The app displays a scrollable list of previous delivery requests with:

- Request ID
- Status (e.g., pending, completed)
- Total price (formatted in Dhs)

### Next Rider Time

At the top, it shows the estimated time for the next available delivery rider, fetched from an API.

---

## 📦 API Endpoints (Mock/Backend Needed)

- `GET /api/user/request/history` → list of past requests
- `POST /api/user/request/send?phone=XXXX` → submit request
- `GET /api/user/request/next-rider` → get next rider ETA

## ▶️ Getting Started

### 1. Clone the project

```bash
git clone https://github.com/your-username/delivery-request-app.git
cd delivery-request-app
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run the app

```bash
flutter run
```

Make sure you have a device or emulator running.

---

## 🧼 Clean Architecture Summary

- **Controller** = handles state and logic
- **Service** = responsible for networking
- **Model** = data layer to parse and format API responses
- **Widgets** = clean UI building blocks

This keeps the UI reactive, testable, and easy to extend or maintain.

