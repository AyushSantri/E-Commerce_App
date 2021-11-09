import 'dart:convert';

import 'package:chapter1/models/catalog.dart';
import 'package:chapter1/widgets/drawer.dart';
import 'package:chapter1/widgets/item_widget.dart';
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
    return Scaffold();
  }
}
