import 'package:chapter1/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  late CatalogModel _catalog;

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel catalog) {
    _catalog = catalog;
  }

  final List<int> _itemsId = [];

  //get items in cart
  List<Item>? get items => _itemsId.map((id) => _catalog.getById(id)).toList();

  //get total price
  num get totalPrice =>
      items!.fold(0, (previousValue, current) => previousValue + current.price);

  //add items
  void add(Item item) {
    _itemsId.add(item.id);
  }

  //remove items
  void remove(Item item) {
    _itemsId.remove(item.id);
  }
}
