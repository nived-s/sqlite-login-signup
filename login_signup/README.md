# Flutter Login and Signup App

This Flutter app demonstrates a simple login and signup system with SQLite database integration.

## Getting Started

Follow these steps to set up and run the app on your local machine.

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) installed on your machine.

### Installation

1. create new flutter project:

   ```sh
   flutter create login-signup-app
   cd login-signup-app
   ```

2. Add the required dependencies to your `pubspec.yaml` file:

   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     sqflite: ^2.0.0
     path: ^2.0.1
   ```

3. Run `flutter pub get` to install the packages.

### Usage

1. Open the project in your preferred code editor.

2. Connect a physical device or start an emulator.

3. Run the app using the following command:

   ```sh
   flutter run
   ```

4. The app should now be running on your device or emulator.

### Features

- Login Page: Enter your email and password to log in. If you're a new user, you can navigate to the signup page.

- Signup Page: Sign up by entering your email and password. After signing up, you can log in with your new credentials.

- Home Screen: Displays a welcome message with the logged-in user's email. Provides a simple demonstration of navigation and data passing.
