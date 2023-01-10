import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertest/models/cart.dart';
import 'package:fluttertest/models/catalog.dart';
import 'package:fluttertest/utils/routes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url="https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  bool isLoadingData = true;
  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData() async{
    // await Future.delayed(Duration(seconds: 2));
    // final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;

    final decodedData=jsonDecode(catalogJson);
    print(decodedData);
    var productsData=decodedData["products"];
    CatalogModel.items=List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {
    isLoadingData = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _cart=(VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation,RemoveMutation},
        builder:(context, MyStore, _)=> FloatingActionButton(
            onPressed: ()=>Navigator.pushNamed(context,MyRoutes.cartRoute),
          backgroundColor: context.theme.buttonColor,
          child: Icon(CupertinoIcons.cart,color: Colors.white,),
        ).badge(color: Vx.red500,size:20,count:_cart.items.length,textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
      ),
      body: (isLoadingData)
            CircularProgressIndicator().centered().py16().expand() : 
      SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
                CatalogList().py16().expand()    
            ],
          ),
        ),
      ),
      );
  }
}
