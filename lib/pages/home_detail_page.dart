import 'package:flutter/material.dart';
import 'package:fluttertest/models/catalog.dart';
import 'package:fluttertest/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key,required this.catalog}) :assert(catalog!=null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          "\$${catalog.price}".text.bold.xl4.make(),
          ElevatedButton(
              onPressed: (){},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyTheme.darkBlueishColor),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
              child: "Buy".text.color(Colors.white).make()
          ).wh(100,50)
        ],
      ).p32(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)
            ).h32(context),
            VxArc(
            height: 10.0,
            arcType: VxArcType.CONVEY,
            edge: VxEdge.TOP,
            child: Container(
              color:Colors.white,
              width: context.screenWidth,
              child: Column(
                children: [
                  catalog.name.text.xl4.color(MyTheme.darkBlueishColor).bold.make(),
                  catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                  10.heightBox,
                ],
              ).py64(),
            ),
            ).expand(),
          ],
        ),
      ),
    );
  }
}
