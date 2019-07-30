import 'package:flutter/material.dart';
import 'package:provider_shop_app/screens/my_cart_screen.dart';
import 'package:provider_shop_app/widgets/catalog_item.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyCartScreen())),
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) => CatalogItem(index),
      ),
    );
  }
}