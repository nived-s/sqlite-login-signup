import 'package:flutter/material.dart';
import 'package:login_signup/screens/home_screen.dart';

import '../services/auth_service.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // func to get user input and call insert function
  void _signup(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;

    // Call the signup function
    await AuthService.signup(email, password);

    // Navigate to the home screen and pass the email as an argument
    // Navigator.pushReplacementNamed(context, '/home',
    //     arguments: {'email': email});

    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => HomeScreen(email: email)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Signup',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the login page
              },
              child: const Text('Already have an account? Login here'),
            ),
            ElevatedButton(
              onPressed: () {
                // inserting new user to table
                _signup(context);
              },
              child: const Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
