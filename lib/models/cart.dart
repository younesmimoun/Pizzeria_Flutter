import 'Pizza.dart';

class CartItem{

  final Pizza pizza;
  int quantity;

  CartItem(this.pizza, [this.quantity = 1]);
}

class Cart{
  List<CartItem> _items = [];

  int totalItems() { return _items.length;}

  CartItem getCartItem(int index){
    return _items[index];
  }

  void addProduct(Pizza pizza){
    int index = findCartItemIndex(pizza.id);
    if(index == -1){
      _items.add(CartItem(pizza));
    }else{
      CartItem item = _items[index];
      item.quantity++;
    }
  }

  void removeProduct(Pizza pizza){
    int index = findCartItemIndex(pizza.id);
    if(index != -1){
      _items.removeAt(index);
    }
  }

  int findCartItemIndex(int id){
    return _items.indexWhere((element) => element.pizza.id == id);
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;

    for (var item in _items) {
      totalPrice += item.pizza.price * item.quantity;
    }

    return totalPrice;
  }
}