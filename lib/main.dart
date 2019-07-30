import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop_app/models/login_model.dart';
import 'package:provider_shop_app/screens/catalog_screen.dart';
import 'package:provider_shop_app/screens/login_screen.dart';

import 'models/cart_model.dart';
import 'models/catalog_model.dart';

void main() => runApp(MyShopApp());

class MyShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          builder: (context) => LoginModel(),
        ),
        Provider(
          builder: (context) => CatalogModel(),
        ),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          builder: (context, catalog, previousCart) =>
              CartModel(catalog, previousCart),
        )
      ],
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(primaryColor: Colors.blue),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/catalog': (context) => CatalogScreen(),
        },
      ),
    );
  }
}
