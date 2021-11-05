import 'package:chapter1/models/catalog.dart';
import 'package:chapter1/widgets/drawer.dart';
import 'package:chapter1/widgets/item_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Catalog App"),
      ),
      body: ListView.builder(
        itemCount: CatalogModel.Items.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            item: CatalogModel.Items[index],
          );
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
