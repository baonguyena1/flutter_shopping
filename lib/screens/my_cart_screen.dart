import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop_app/models/cart_model.dart';
import 'package:provider_shop_app/widgets/catalog_item.dart';

class MyCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: _CartList(),
            ),
            Divider(
              height: 4,
            ),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => CatalogItem(index),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<CartModel>(
              builder: (context, cart, child) {
                return Text(
                  '${cart.totalPrice}',
                  style: Theme.of(context)
                      .textTheme
                      .display4
                      .copyWith(fontSize: 48),
                );
              },
            ),
            SizedBox(
              width: 20,
            ),
            FlatButton(
              onPressed: () {},
              color: Colors.blue,
              child: Text(
                'BUY',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
