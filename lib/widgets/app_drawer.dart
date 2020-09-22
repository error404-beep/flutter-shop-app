import 'package:flutter/material.dart';

import '../screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello User!'),
            automaticallyImplyLeading: false, //Wouldn't insert a back button,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('SHOP!'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.payment),
              title: Text('ORDERS!'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(OrdersScreen.routeName);
              }),
        ],
      ),
    );
  }
}
