import 'package:flutter/material.dart';
import 'package:mis_asesorias/pages/account_page.dart';
import 'package:mis_asesorias/pages/account_page_instructor.dart';
import 'package:mis_asesorias/pages/home_page.dart';
import 'package:mis_asesorias/pages/login_page.dart';
import 'package:mis_asesorias/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MisAsesorias',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primarySwatch: Colors.blue,
    ),

    initialRoute: '/',
    routes: {

      '/': (BuildContext context) => const HomePage(),
      '/login': (BuildContext context) => const LoginPage(),
      '/signup': (BuildContext context) => const SignupPage(),
      '/acountPage': (BuildContext context) => const AccountPage(),
      '/acountPageInstructor': (BuildContext context) => const AccountPageInstructor(),
      }
    );
  }
}

