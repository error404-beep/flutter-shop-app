import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productID =
        ModalRoute.of(context).settings.arguments as String; //ID of product
    final productLoaded = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productID);
    return Scaffold(
      appBar: AppBar(
        title: Text(productLoaded.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 300,
              width: double.infinity,
              child: Image.network(
                productLoaded.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '₹${productLoaded.price}',
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              productLoaded.description,
              textAlign: TextAlign.center,
              softWrap: true,
            )
          ],
        ),
      ),
    );
  }
}
