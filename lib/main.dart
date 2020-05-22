import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shoppy/components/horizontal_listview.dart';

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
        autoplay: false,
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
        title: Text('Shoppy'),
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
              onPressed: null)
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
                child: ListTile(
                    title: Text('Categories'),
                    leading: Icon(
                      Icons.dashboard,
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
                    title: Text('Settings'), leading: Icon(Icons.settings))),
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
            child: Text('Categories'),
          ),
          //horizontal  LISTVIEW
          horizontalListView(),
        ],
      ),
    );
  }
}
