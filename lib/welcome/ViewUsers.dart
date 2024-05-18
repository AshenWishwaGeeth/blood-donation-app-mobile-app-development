import 'package:flutter_application_1/database/datamodule/user.dart';
import 'package:flutter_application_1/db_operation/useraction.dart'; // Import the UserOperations class

void main() async {
  try {
    // Get all users from the database
    List<User> users = await UserOperations.users();

    if (users.isEmpty) {
      print('No users found in the database.');
      return;
    }

    // Print the details of each user
    for (User user in users) {
      print('ID: ${user.id}');
      print('Username: ${user.username}');
      print('First Name: ${user.firstName}');
      print('Last Name: ${user.lastName}');
      print('Email: ${user.email}');
      print('Contact No: ${user.contactNo}');
      print('Gender: ${user.gender}');
      print('Location: ${user.location}');
      print('---------------------------------');
    }
  } catch (e) {
    print('Error fetching users: $e');
  }
}
