import 'database_helper.dart'; // Import the database helper

class AuthenticationService {
  // Define a static method for authenticating users
  static Future<bool> authenticateUser(String email, String password) async {
    // Call the getUserDetailsByEmail method from DatabaseHelper
    final userDetails =
        await DatabaseHelper.instance.getUserDetailsByEmail(email);

    // Check if userDetails is not null (user with provided email exists)
    // and if the password matches the one stored in the database
    if (userDetails != null && userDetails['password'] == password) {
      return true; // Authentication successful
    }

    return false; // Authentication failed
  }
}
