import 'Pizza.dart';

class PizzaData {
  static List<Pizza> buildList() {
    List<Pizza> list = [];
    list.add(Pizza(1, 'Barbecue', 'La garniture', 'pizza-bbq.jpg', 8));
    list.add(Pizza(2, 'Hawai', 'La garniture', 'pizza-hawai.jpg', 9));
    list.add(Pizza(3, 'Epinards', 'La garniture', 'pizza-spinach.jpg', 7));
    list.add(
        Pizza(4, 'Végétarienne', 'La garniture', 'pizza-vegetable.jpg', 10));
    list.add(Pizza(5, 'Câpres', 'La garniture', 'pizza-capers.png', 8));
    list.add(Pizza(6, 'Francfort', 'La garniture', 'pizza-frankfurt.png', 9));
    list.add(Pizza(7, 'Merguez', 'La garniture', 'pizza-merguez.png', 7));
    list.add(Pizza(8, 'Salami', 'La garniture', 'pizza-salami.png', 9));
    list.add(Pizza(9, 'Salami double', 'La garniture', 'pizza-salami.png', 10));
    return list;
  }
}
