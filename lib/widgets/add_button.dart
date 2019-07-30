import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop_app/models/cart_model.dart';
import 'package:provider_shop_app/models/item.dart';

class AddButton extends StatelessWidget {
  final Item item;

  AddButton(this.item, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    return Container(
      constraints: BoxConstraints(
        maxWidth: 60,
      ),
      child: FlatButton(
        splashColor: Theme.of(context).primaryColor,
        onPressed: cart.items.contains(item) ? null : () => cart.add(item),
        child: cart.items.contains(item)
            ? Icon(Icons.check_circle)
            : Icon(Icons.add),
      ),
    );
  }
}
