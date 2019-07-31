import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop_app/models/catalog_model.dart';

import 'add_button.dart';

class CatalogItem extends StatelessWidget {
  final int index;

  CatalogItem(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var catalog = Provider.of<CatalogModel>(context);
    var item = catalog.getByPosition(index);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 60,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          child: Row(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(color: Colors.transparent),
                      color: item.color),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(item.name, style: Theme.of(context).textTheme.title),
                    Text('Price: ${item.price}', style: Theme.of(context).textTheme.subtitle),
                  ],
                )
              ),
              SizedBox(
                width: 10,
              ),
              AddButton(item),
            ],
          ),
        ),
      ),
    );
  }
}