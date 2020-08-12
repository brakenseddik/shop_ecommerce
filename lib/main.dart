import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shoppy/components/horizontal_listview.dart';
import 'package:shoppy/pages/cart.dart';
import 'package:shoppy/pages/home.dart';
import 'package:shoppy/pages/login.dart';
import 'package:shoppy/pages/register.dart';
import 'package:shoppy/provider/userProvider.dart';
import 'components/products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => UserProvider.initialize(),
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.amber),
        debugShowCheckedModeBanner: false,
        home: ScreensController(),
      )));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
