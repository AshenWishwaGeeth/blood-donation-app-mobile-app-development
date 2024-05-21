// Import necessary packages and screens
import 'package:flutter/material.dart';
import 'package:flutter_application_1/welcome/signup.dart'; // Import ViewUsers.dart

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _errorText = ''; // Error message text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      backgroundColor: Colors.black, // Set background color to black
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email TextField
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red), // Red border color
                ),
                labelStyle: TextStyle(color: Color.fromARGB(255, 229, 239, 198)), // Blue label text color
              ),
              style: TextStyle(color: Colors.white), // White text color
            ),
            SizedBox(height: 16.0),
            // Password TextField
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red), // Red border color
                ),
                labelStyle: TextStyle(color: Color.fromARGB(255, 144, 211, 89)), // Blue label text color
              ),
              style: TextStyle(color: Colors.white), // White text color
            ),
            SizedBox(height: 16.0),
            // Error Text (Displayed conditionally)
            Text(
              _errorText,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 16.0),
            // Login Button
            ElevatedButton(
              onPressed: () async {
                // Your login logic
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // White text color
                backgroundColor: Colors.red, // Red button color
              ),
            ),
            SizedBox(height: 8.0), // Add some space between buttons
            // Register Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()), // Navigate to SignUpPage
                );
              },
              child: Text('Register'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // White text color
                backgroundColor: Colors.blue, // Blue button color
              ),
            ),
            SizedBox(height: 8.0), // Add some space between buttons
            // View All Members Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewUsers()), // Navigate to ViewUsers
                );
              },
              child: Text('View All Members'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // White text color
                backgroundColor: Colors.green, // Green button color
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

ViewUsers() {
}
