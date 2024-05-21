import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'firebase_options.dart';
import 'welcome/welcomepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Initialize Firebase asynchronously

  await initializeDatabase(); // Initialize the database
  runApp(const MyApp());
}

Future<void> initializeDatabase() async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'user_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, firstName TEXT, lastName TEXT, email TEXT, contactNo TEXT, gender TEXT, password TEXT, location TEXT)',
      );
    },
    version: 1,
  );

  
  
  await database;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Donation Champ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      home: const WelcomePage(),
    );
  }
}
