import 'package:shoppy/provider/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:shoppy/widgets/custom_app_bar.dart';
import 'package:shoppy/widgets/featured_products.dart';
import 'package:shoppy/widgets/product_card.dart';
import 'package:shoppy/widgets/search.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
//           Custom App bar
            CustomAppBar(),

//          Search Text field
            Search(),

//            featured products
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: new Text('Featured products',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold))),
            ),
            FeaturedProducts(),

//          recent products
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: new Text(
                    'Recent products',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
            ),

            ProductCard(
              brand: 'SantosBrand',
              name: 'Lux Blazer',
              price: 24.00,
              onSale: true,
              picture: '',
            ),
          ],
        ),
      ),
    );
  }
}
