import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/datamodule/user.dart';

class UserDetailsPage extends StatelessWidget {
  final User user;

  UserDetailsPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: ${user.username}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('First Name: ${user.firstName}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Last Name: ${user.lastName}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Email: ${user.email}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Contact No: ${user.contactNo}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Gender: ${user.gender}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Location: ${user.location}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
