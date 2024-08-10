import 'package:flutter/material.dart';
import 'package:track_tree/pages/auth_page.dart';
import 'package:track_tree/pages/signup.dart';
import 'package:track_tree/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes:{
        '/':(context) => AuthPage(),
        '/signup':(context)=>SignUp(),
        '/dashboard': (context) => const Dashboard(),
      }
    );
}
}
