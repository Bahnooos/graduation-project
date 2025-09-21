# Masarak App

A modern mobile application featuring a beautiful and user-friendly authentication flow. This project demonstrates a sleek Login and Signup experience, with social login options, password management, and visually consistent design optimized for Android devices.

**AI-Powered Live Streaming & Object Detection:**  
This project leverages artificial intelligence for live video streaming through the device camera, enabling real-time detection of objects. The AI integration provides smarter and safer driving experiences by analyzing video feeds and identifying relevant objects instantly during live tracking sessions.

---


## 🎨 System Design
![Screenshot 2025-03-15 023922](https://github.com/user-attachments/assets/60da0170-a6fe-472a-a273-f5dbe9ef32e3)

## Screenshots

### Splash Screen

| Splash |
|--------------|
| <img width="1080" height="2160" alt="Screenshot_20250612-220825" src="https://github.com/user-attachments/assets/5e942424-db3c-4b55-a249-ad1ffff2c31d" />
 |

### Login Screens

| Login (Empty) | Login (Filled) |
|--------------|----------------|
| <img width="1080" height="2160" alt="Screenshot_20250612-220218" src="https://github.com/user-attachments/assets/4cbee155-b0e7-400f-b7cd-6aab3e920694" />
 | <img width="1080" height="2160" alt="Screenshot_20250612-220402" src="https://github.com/user-attachments/assets/24734d97-9000-41e0-a7b8-9039a4ee4640" />
 |

---

### Signup Screens

| Signup (Empty) | Signup (Filled) |
|----------------|-----------------|<img width="1080" height="2160" alt="Screenshot_20250612-220231" src="https://github.com/user-attachments/assets/3e341aab-8aba-4077-8495-5ec9eb4f4d8a" />
 |  |

---

### Main App Screens

| Home | Live Tracking |
|:-------------:|:-------------:|
| <img width="1080" height="2160" alt="Screenshot_20250612-220420" src="https://github.com/user-attachments/assets/eff4c26e-2db2-4c73-bcd2-62aa44128eed" />
 |<img width="1080" height="2160" alt="Screenshot_20250612-221450" src="https://github.com/user-attachments/assets/72945829-9974-4e93-81a1-da9f081e08c4" />
 |

---

## Features

- Elegant onboarding with a stylish background image
- Responsive email and password input fields
- "Forget Password?" link for password recovery
- Signup and Login navigation links
- Google social login button
- Password confirmation for signup for improved security
- AI-powered live video streaming from the camera
- Real-time object detection during live streaming
- Live tracking of vehicles and road scenes
- History of tracked sessions with playback
- Device Preview toggle for development/testing

---

## Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Bahnooos/graduation-project.git
   cd graduation-project
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

---

## Project Structure

- `lib/`
  - `screens/`
    - `login.dart` — Login UI & logic
    - `signup.dart` — Signup UI & logic
    - `home.dart` — Home and main features
    - `tracking.dart` — Live tracking and AI object detection
    - `history.dart` — Tracking session history
  - `widgets/` — Custom widgets for forms, buttons, etc.
  - `main.dart` — App entrypoint

---

## Technologies Used

- **Flutter** (Dart)
- **Firebase Auth** (recommended for authentication)
- **Google Sign-In**
- **Provider / Bloc** (for state management)
- **TensorFlow Lite / ML Kit** (for AI and object detection)
- **Camera plugin** for live video streaming

---

## Customization

- Change the background image in `assets/images/`
- Adjust color scheme and UI in `lib/theme/`
- Add additional social logins in `lib/screens/login.dart`
- Update AI model for object detection as needed

---

## Contributing

Contributions, issues, and feature requests are welcome!  
Feel free to check the [issues page](https://github.com/Bahnooos/graduation-project/issues).

---
