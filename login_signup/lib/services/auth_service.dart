import 'database_helper.dart'; // Import the database helper

class AuthService {
  // Define a static method for user signup
  static Future<void> signup(String email, String password) async {
    Map<String, dynamic> row = {
      'email': email, // Store the provided email in the 'email' column
      'password': password, // Store the provided password in the 'password' column
    };
    await DatabaseHelper.instance.insertUser(row); // Call the insertUser method from the DatabaseHelper to insert the row
  }
}
