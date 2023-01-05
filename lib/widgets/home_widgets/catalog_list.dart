import 'package:flutter/material.dart';
import 'package:fluttertest/models/catalog.dart';
import 'package:fluttertest/pages/home_detail_page.dart';
import 'catalog_Item.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context,index) {
        final Catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () =>
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: Catalog),
                    ),
                ),
                  child: CatalogItem(catalog: Catalog),
        );
      },
    );
  }
}


