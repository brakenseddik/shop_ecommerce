import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shoppy/components/horizontal_listview.dart';
import 'package:shoppy/pages/cart.dart';
import 'package:shoppy/pages/home.dart';
import 'package:shoppy/pages/login.dart';
import 'package:shoppy/pages/register.dart';
import 'components/products.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.amber),
    debugShowCheckedModeBanner: false,
    home: Login(),
  ));
}
