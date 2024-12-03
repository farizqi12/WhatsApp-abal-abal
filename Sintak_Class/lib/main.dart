import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sintak Class',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green, 
      ),
      home: const LoginScreen(),
      initialRoute: 'MainScreen',

    );
  }
}


