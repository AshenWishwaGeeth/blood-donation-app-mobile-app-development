import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/datamodule/user.dart';
import 'package:flutter_application_1/db_operation/useraction.dart';
import 'package:image_picker/image_picker.dart'; // Import the UserOperations class

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _contactNoController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _retypePasswordController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  File? _image;
  String? _selectedGender;

  Widget _buildOvalTextFieldWithIcon({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0), // Make it oval-shaped
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(
            icon,
            color: Colors.blueAccent,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        ),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0), // Make it oval-shaped
        border: Border.all(color: Colors.blueAccent),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        value: _selectedGender,
        decoration: InputDecoration(
          hintText: 'Gender',
          border: InputBorder.none,
        ),
        onChanged: (newValue) {
          setState(() {
            _selectedGender = newValue;
          });
        },
        items: ['Male', 'Female', 'Other'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: Colors.blueAccent),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _showImagePicker(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void signUp() async {
    if (_passwordController.text != _retypePasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Passwords do not match')));
      return;
    }

    final newUser = User(
      username: _usernameController.text,
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      contactNo: _contactNoController.text,
      gender: _selectedGender ?? 'Other',
      password: _passwordController.text,
      location: _locationController.text,
    );

    await UserOperations.insertUser(newUser);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User successfully registered')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'REGISTER',
          style: TextStyle(color: Colors.blueAccent),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      backgroundColor: Colors.blueAccent.withOpacity(0.1),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                _showImagePicker(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blueAccent.withOpacity(0.2),
                  child: _image != null
                      ? ClipOval(
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                            width: 100.0,
                            height: 100.0,
                          ),
                        )
                      : Icon(
                          Icons.camera_alt,
                          size: 50,
                          color: Colors.blueAccent,
                        ),
                ),
              ),
            ),
            _buildOvalTextFieldWithIcon(
              controller: _firstNameController,
              labelText: 'First Name',
              icon: Icons.person,
            ),
            _buildOvalTextFieldWithIcon(
              controller: _lastNameController,
              labelText: 'Last Name',
              icon: Icons.person,
            ),
            _buildOvalTextFieldWithIcon(
              controller: _emailController,
              labelText: 'Email',
              icon: Icons.email,
            ),
            _buildOvalTextFieldWithIcon(
              controller: _contactNoController,
              labelText: 'Contact No',
              icon: Icons.phone,
            ),
            _buildGenderDropdown(),
            _buildOvalTextFieldWithIcon(
              controller: _usernameController,
              labelText: 'Username',
              icon: Icons.account_circle,
            ),
            _buildOvalTextFieldWithIcon(
              controller: _passwordController,
              labelText: 'Password',
              icon: Icons.lock,
            ),
            _buildOvalTextFieldWithIcon(
              controller: _retypePasswordController,
              labelText: 'Retype Password',
              icon: Icons.lock,
            ),
            _buildOvalTextFieldWithIcon(
              controller: _locationController,
              labelText: 'Location',
              icon: Icons.location_on,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: signUp, // Call the signUp method here
              child: Text('Signup'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _contactNoController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _retypePasswordController.dispose();
    _locationController.dispose();
    super.dispose();
  }
}
