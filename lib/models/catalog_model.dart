import 'package:provider_shop_app/models/item.dart';

class CatalogModel {
  static const _itemNames = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];

  Item getById(int id) => Item(id, _itemNames[id % _itemNames.length]);

  Item getByPosition(int position) => getById(position);
}
