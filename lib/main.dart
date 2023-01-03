import 'package:flutter/material.dart';
import 'package:fluttertest/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

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
      theme: ThemeData(primarySwatch: Colors.amber,fontFamily: GoogleFonts.lato().fontFamily),
      darkTheme: ThemeData(
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        '/':(context)=> LoginPage(),
        MyRoutes.homeRoute:(context)=> HomePage(),
        MyRoutes.loginRoute:(context)=> LoginPage(),
      },
    );
  }
}
