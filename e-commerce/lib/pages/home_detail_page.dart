import 'package:chapter1/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: Key(item.id.toString()),
              child: Image.network(item.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
