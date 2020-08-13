import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  static const NAME = 'name';
  static const PRICE = 'price';
  static const ID = 'id';
  static const BRAND = 'brand';
  static const CATEGORY = 'category';
  static const COLORS = 'colors';
  static const QUANTITY = 'quantity';
  static const SIZES = 'sizes';
  static const SALE = 'sale';
  static const FEATURED = 'featured';
  static const PICTURE = 'picture';

  String _name;
  String _brand;
  String _category;
  String _picture;
  int _quantity;
  double _price;
  List _sizes;
  List _colors;
  bool _onSale;
  bool _featured;
  String _id;

  //getters
  String get name => _name;

  String get brand => _brand;

  String get picture => _picture;

  String get id => _id;

  String get category => _category;

  int get quantity => _quantity;

  double get price => _price;

  List get sizes => _sizes;

  List get colors => _colors;

  bool get onSale => _onSale;

  bool get featured => _featured;

  //Constructor
  Product.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data;

    _name = data[NAME];
    _brand = data[BRAND];
    _price = data[PRICE];
    _quantity = data[QUANTITY];
    _colors = data[COLORS];
    _sizes = data[SIZES];
    _onSale = data[SALE];
    _id = data[ID];
    _category = data[CATEGORY];
    _featured = data[FEATURED];
    _picture = data[PICTURE];
  }
}
