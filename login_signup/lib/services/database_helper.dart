import 'package:sqflite/sqflite.dart'; // Import the sqflite package
import 'package:path/path.dart'; // Import the path package

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper
      ._privateConstructor(); // Create a singleton instance of the DatabaseHelper class
  static Database? _database; // Store a reference to the database

  DatabaseHelper._privateConstructor(); // Private constructor to enforce the singleton pattern

  // create or use database
  Future<Database> get database async {
    if (_database != null)
      return _database!; // If a database instance already exists, return it
    _database =
        await _initDatabase(); // If not, initialize the database and store the instance
    return _database!; // Return the database instance
  }

  // accessing database stored locally in device
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(),
        'my_database.db'); // Get the path for the database file
    return await openDatabase(
      // Open the database with the provided path
      path,
      version: 1, // Set the version number for the database
      onCreate:
          _onCreate, // Specify the function to run when creating the database
    );
  }

  // creating table
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users_details (
        id INTEGER PRIMARY KEY,
        email TEXT,
        password TEXT
      )
    '''); // Execute SQL to create the 'users_details' table with columns id, email, and password
  }

  // insert to table
  Future<int> insertUser(Map<String, dynamic> row) async {
    Database db = await instance.database; // Get a reference to the database
    return await db.insert('users_details',
        row); // Insert the provided data into the 'users_details' table
  }

  // login
  Future<Map<String, dynamic>?> getUserDetailsByEmail(String email) async {
    // Get a reference to the database
    Database db = await instance.database;

    // Query the 'users_details' table to retrieve user details based on the provided email
    List<Map<String, dynamic>> results = await db.rawQuery(
      'SELECT * FROM users_details WHERE email = ? LIMIT 1',
      [email],
    );

    // Check if there are results returned from the query
    if (results.isNotEmpty) {
      // Return the first result (should be the only one due to the limit)
      return results.first;
    }

    // Return null if no user details are found for the provided email
    return null;
  }
}
