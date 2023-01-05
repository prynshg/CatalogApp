import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertest/widgets/drawer.dart';
import 'package:fluttertest/widgets/item_widget.dart';
import 'package:fluttertest/models/catalog.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days=30;
  final String name="Codepur";
  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData() async{
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData=jsonDecode(catalogJson);
    var productsData=decodedData["products"];
    CatalogModel.items=List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Catalog App",
        ),
      ),
      body:Padding(padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items!=null && CatalogModel.items.isNotEmpty)? ListView.builder(
        itemCount: CatalogModel.items.length,
        itemBuilder: (context,index) {
        return ItemWidget(item: CatalogModel.items[index]);
        },
      ):Center(
          child: CircularProgressIndicator(),
        ),
      ),
    drawer: MyDrawer(),
      );
  }
}

