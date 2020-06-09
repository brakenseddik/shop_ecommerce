import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shoppy/components/horizontal_listview.dart';
import 'package:shoppy/pages/cart.dart';

import 'components/products.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget carousel = Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.cover,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotColor: Colors.amber,
        dotBgColor: Colors.transparent,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
        ],
      ),
    );
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
            onPressed: () {},
          ),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              }),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //Header
            UserAccountsDrawerHeader(
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Colors.amber),
              accountEmail: Text('seddik.braken@gmail.com'),
              accountName: Text('Braken Mohammed'),
            ),
            //Body
            InkWell(
                child: ListTile(
                    title: Text('Homepage'),
                    leading: Icon(
                      Icons.home,
                      color: Colors.amber,
                    ))),
            InkWell(
                child: ListTile(
                    title: Text('My Account'),
                    leading: Icon(
                      Icons.person,
                      color: Colors.amber,
                    ))),
            InkWell(
                child: ListTile(
                    title: Text('My Orders'),
                    leading: Icon(
                      Icons.shopping_basket,
                      color: Colors.amber,
                    ))),
            InkWell(
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart())),
                child: ListTile(
                    title: Text('Shopping Cart'),
                    leading: Icon(
                      Icons.shopping_cart,
                      color: Colors.amber,
                    ))),
            InkWell(
                child: ListTile(
                    title: Text('Favorites'),
                    leading: Icon(
                      Icons.favorite,
                      color: Colors.amber,
                    ))),
            Divider(),
            InkWell(
                child: ListTile(
                    title: Text('Settings'),
                    leading: Icon(
                      Icons.settings,
                      color: Colors.lightBlue,
                    ))),
            InkWell(
                child: ListTile(
                    title: Text('About'),
                    leading: Icon(
                      Icons.help,
                      color: Colors.green,
                    ))),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          carousel,
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Categories',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                  color: Colors.orange),
            ),
          ),
          //horizontal  LISTVIEW
          horizontalListView(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Recent products',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                  color: Colors.orange),
            ),
          ),
          // GRIDVIEW
          Container(
            height: 320,
            child: Products(),
          )
        ],
      ),
    );
  }
}
