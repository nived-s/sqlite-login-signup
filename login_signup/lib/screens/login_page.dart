import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              'Login',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text('New user? Sign up here'),
            ),
            ElevatedButton(
              onPressed: () {
                // Simulate a successful login
                // Replace this with your actual login logic
                String enteredUsername =
                    "username"; // Replace with actual username
                Navigator.pushReplacementNamed(context, '/home',
                    arguments: {'username': enteredUsername});
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
