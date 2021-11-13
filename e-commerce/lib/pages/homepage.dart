import 'dart:convert';

import 'package:chapter1/models/catalog.dart';
import 'package:chapter1/pages/home_detail_page.dart';
import 'package:chapter1/utils/routes.dart';
import 'package:chapter1/widgets/drawer.dart';
import 'package:chapter1/widgets/item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadState();
  }

  loadState() async {
    await Future.delayed(const Duration(seconds: 2));

    var catalogJSON = await rootBundle
        .loadString("files/catalog.json"); //this will convert JSON into string
    var decodedJSON = jsonDecode(
        catalogJSON); // this will convert string into Map i.e, key value pair
    var productData = decodedJSON["products"];

    CatalogModel.Items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        child: const Icon(CupertinoIcons.shopping_cart),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Catalog App".text.xl5.bold.make(),
              "trending products".text.xl2.make(),
              if (CatalogModel.Items != null && CatalogModel.Items.isNotEmpty)
                CatalogList().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomeDetailPage(item: CatalogModel.Items[index])),
                ),
            child: ItemWidget(item: CatalogModel.Items[index]));
      },
      itemCount: CatalogModel.Items.length,
    );
  }
}
