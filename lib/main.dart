import 'package:flutter/material.dart';

import 'pages/HomePage.dart';
import 'pages/LoginPage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(primarySwatch: Colors.amber),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),

      routes: {
        '/':(context)=> const HomePage(),
        '/login':(context)=> const LoginPage(),
      },
    );
  }
}
