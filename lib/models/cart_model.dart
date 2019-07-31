import 'package:flutter/foundation.dart';
import 'package:provider_shop_app/models/catalog_model.dart';
import 'item.dart';

class CartModel extends ChangeNotifier {
  CartModel(this._catalog, CartModel previous)
    : assert(_catalog != null),
    _itemIds = previous?._itemIds ?? [];

  final CatalogModel _catalog;

  final List<int> _itemIds;

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();
  
  int get totalPrice => items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.removeWhere((id) => item.id == id);
    notifyListeners();
  }
}