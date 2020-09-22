import 'package:flutter/foundation.dart';

class CartItem {
  final String
      id; //Not the same as Product ID as it also contains info about quantity and price.
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.price,
    @required this.quantity,
    @required this.title,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items =
      {}; //If we dont define it as an empty map it will throw null errors.

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length ??
        0; //This is the null aware operator. It will return 0 only if the list is null.
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(
    String productId,
    double price,
    String title,
  ) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCardItem) => CartItem(
            id: existingCardItem.id,
            price: existingCardItem.price,
            quantity: existingCardItem.quantity + 1,
            title: existingCardItem.title),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          price: price,
          quantity: 1,
          title: title,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity > 1) {
      _items.update(
        productId,
        (prod) => CartItem(
          id: prod.id,
          price: prod.price,
          quantity: prod.quantity - 1,
          title: prod.title,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
