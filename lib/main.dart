import 'package:flutter_application_1/welcome/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async { // Make the main function asynchronous
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  ); // Initialize Firebase asynchronously
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}); // Use Key? key instead of super.key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Donation Champ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple), // Changed fromSeed to fromSwatch
        // Removed 'useMaterial3: true' because it's not recognized in ThemeData
      ),
      home: WelcomePage(),
    );
  }
}
