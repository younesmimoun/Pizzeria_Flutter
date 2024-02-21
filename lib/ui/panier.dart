import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzeria/ui/share/pizzeria_style.dart';

import '../models/cart.dart';

class Panier extends StatefulWidget {
  final Cart _cart;
  const Panier(this._cart, {Key? key}) : super(key : key);

  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panier'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget._cart.totalItems(),
              itemBuilder: (BuildContext context, int index) {
                return _builtItem(widget._cart.getCartItem(index));
              },
            ),
          ),
          Container(
              alignment: Alignment.center,
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              defaultColumnWidth: IntrinsicColumnWidth(),
                children: [
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('TOTAL HT', style: PizzeriaStyle.regularTextStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${widget._cart.calculateTotalPrice()} €', style: PizzeriaStyle.regularTextStyle,),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('TVA', style: PizzeriaStyle.regularTextStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${(widget._cart.calculateTotalPrice() * 0.10).toStringAsFixed(2)} €', style: PizzeriaStyle.regularTextStyle),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('TOTAL TTC', style: PizzeriaStyle.regularTextStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${(widget._cart.calculateTotalPrice() * 1.10).toStringAsFixed(2)} €', style: PizzeriaStyle.regularTextStyle),
                    ),
                  ])
                ],

            )
          ),
          Container(
            child: ElevatedButton(
              child: Text("Valider", style : TextStyle(
                color: Colors.white
              )),
              onPressed: (){
                print('Valider');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _builtItem(CartItem cartItem){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          'assets/images/pizza/${cartItem.pizza.image}',
          height: 180,
        ),
        Column(
          children: [
            Text(cartItem.pizza.title, style: PizzeriaStyle.priceTotalTextStyle,),
            Row(
              children: [
                Text("${cartItem.pizza.total} €", style: PizzeriaStyle.itemPriceTextStyle,),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if(cartItem.quantity > 1){
                          _updateQuantity(cartItem, -1);
                        }
                        else{
                          widget._cart.removeProduct(cartItem.pizza);
                          setState(() {});
                        }
                      },
                      icon: Icon(Icons.remove_rounded),
                    ),
                    Text("${cartItem.quantity}"),
                    IconButton(
                      onPressed: () {
                        _updateQuantity(cartItem, 1);
                      },
                      icon: Icon(Icons.add_rounded),
                    )
                  ],
                )
              ],
            ),
            Text("Sous-Total : ${cartItem.pizza.total * cartItem.quantity} €", style: PizzeriaStyle.priceTotalTextStyle),
          ],
        )
      ],
    );
  }
  void _updateQuantity(CartItem cartItem, int amount) {
    setState(() {
      cartItem.quantity += amount;
    });
  }
}
