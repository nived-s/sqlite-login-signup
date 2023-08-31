import 'package:flutter/material.dart';
// importing screens
import 'screens/home_screen.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';
import 'services/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.database; // Initialize the database
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login & Signup App',
      initialRoute: '/login', // Set the initial route
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/home': (context) {
          final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
          final email = args['email'] as String;
          return HomeScreen(email: email);
        },
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(builder: (context) => HomeScreen(email: args['email']));
        }
        return null;
      },
    );
  }
}
