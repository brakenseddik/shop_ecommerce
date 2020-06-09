import 'package:flutter/material.dart';
import 'package:shoppy/main.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Text('Shoppy')),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: null),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: null),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
                child: ListTile(
              title: Text('Total:'),
              subtitle: Text('\$130'),
            )),
            Expanded(
                child: MaterialButton(
              color: Colors.red,
              onPressed: () {},
              child: Text(
                'Check out',
                style: TextStyle(color: Colors.white),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
