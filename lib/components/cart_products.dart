import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var cart_products_list = [
    {
      'name': 'Black Blazer',
      'picture': 'images/products/blazer1.jpeg',
      'price': 78,
      'quantity': 1,
      'size': 'm',
      'color': 'red'
    },
    {
      'name': 'Hills boi',
      'picture': 'images/products/hills2.jpeg',
      'price': 87,
      'quantity': 1,
      'size': 'm',
      'color': 'red'
    },
    {
      'name': 'red skirt',
      'picture': 'images/products/skt1.jpeg',
      'price': 44,
      'quantity': 1,
      'size': 'm',
      'color': 'red'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return SingleCartProduct(
            cart_prod_name: cart_products_list[index]['name'],
            cart_prod_picture: cart_products_list[index]['picture'],
            cart_prod_price: cart_products_list[index]['price'],
            cart_prod_color: cart_products_list[index]['color'],
            cart_prod_size: cart_products_list[index]['size'],
            cart_prod_qte: cart_products_list[index]['quantity'],
          );
        });
  }
}

class SingleCartProduct extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qte;

  SingleCartProduct(
      {this.cart_prod_name,
      this.cart_prod_picture,
      this.cart_prod_price,
      this.cart_prod_color,
      this.cart_prod_qte,
      this.cart_prod_size});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          cart_prod_picture,
          width: 80,
          height: 80,
        ),
        title: Text(cart_prod_name),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Expanded(
                    child: Text('Size: '),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Expanded(
                    child: Text(
                      cart_prod_size,
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Expanded(
                    child: Text('Color: '),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Expanded(
                    child: Text(
                      cart_prod_color,
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                '\$${cart_prod_price}',
                style: TextStyle(fontSize: 18.0, color: Colors.amber),
              ),
            )
          ],
        ),
        trailing: FittedBox(
          fit: BoxFit.cover,
          child: Column(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.arrow_drop_up,
                    color: Colors.black,
                  ),
                  onPressed: null),
              Text(
                '$cart_prod_qte',
                style: TextStyle(fontSize: 24),
              ),
              IconButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  onPressed: null)
            ],
          ),
        ),
      ),
    );
  }
}
