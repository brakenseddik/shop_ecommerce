import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppy/db/products.dart';
import 'package:shoppy/models/product.dart';

class AppProvider with ChangeNotifier {
  List<Product> _featuredProducts = [];
  ProductsService _productsService = ProductsService();

  AppProvider() {
    _getFeaturedProducts();
  }

  List<Product> get featuredProducts => _featuredProducts;

  void _getFeaturedProducts() async {
    _featuredProducts = await _productsService.getFeaturedProducts();
    notifyListeners();
  }
}
