import 'package:flutter/material.dart';
import 'package:fluttertest/widgets/drawer.dart';
import 'package:fluttertest/widgets/item_widget.dart';
import 'package:fluttertest/models/catalog.dart';
class HomePage extends StatelessWidget {
  final int days=30;
  final String name="Codepur";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummyList=List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Catalog App",
        ),
      ),
      body:Padding(padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
        itemCount: dummyList.length,
        itemBuilder: (context,index) {
        return ItemWidget(item: dummyList[index]);
        },
      ),
      ),
    drawer: MyDrawer(),
      );
  }
}

