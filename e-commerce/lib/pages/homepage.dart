import 'package:chapter1/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: const Text('Hello World'),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
