import 'package:flutter/material.dart';
import 'package:fluttertest/widgets/drawer.dart';
class HomePage extends StatelessWidget {
  final int days=30;
  final String name="Codepur";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
        child: Text("Welcome to $days days of flutter by $name"),
        ),
      ),
      drawer: MyDrawer(),
      );
  }
}

