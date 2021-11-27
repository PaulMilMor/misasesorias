import 'package:flutter/material.dart';
import 'package:mis_asesorias/pages/account_page.dart';
import 'package:mis_asesorias/pages/account_page_instructor.dart';
import 'package:mis_asesorias/pages/chat_screen.dart';
import 'package:mis_asesorias/pages/create_courses.dart';
import 'package:mis_asesorias/pages/edit_course.dart';
import 'package:mis_asesorias/pages/home_page.dart';
import 'package:mis_asesorias/pages/login_page.dart';
import 'package:mis_asesorias/pages/navigation_page.dart';
import 'package:mis_asesorias/pages/signup_page.dart';

import 'pages/feed_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode _currentFocus = FocusScope.of(context);
        _unfocus(_currentFocus);
      },
      child: MaterialApp(
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
            '/acountPageInstructor': (BuildContext context) =>
                const AccountPageInstructor(),
            '/feed': (BuildContext context) => const FeedPage(),
            '/navigation': (BuildContext context) => const NavigationPage(),
            '/createCourse': (BuildContext context) => const CreateCoursePage(),
            '/editCourse': (BuildContext context) => const EditCoursePage(),
            '/chatscreen': (BuildContext context) => const ChatScreenPage(),
          }),
    );
  }

//Esta función es para perder el focus en un elemento al tocar cualquier parte vacía de la app
  void _unfocus(FocusScopeNode _currentFocus) {
    if (!_currentFocus.hasPrimaryFocus && _currentFocus.focusedChild != null) {
      _currentFocus.focusedChild!.unfocus();
    }
  }
}
