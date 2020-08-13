class Product {
  static const NAME = 'name';
  static const PRICE = 'price';
  static const BRAND = 'brand';
  static const CATEGORY = 'category';
  static const COLORS = 'colors';
  static const QUANTITY = 'quantity';
  static const SIZES = 'sizes';
  static const ONSALE = 'onSale';
  static const FEATURED = 'featured';

  String _name;
  String _brand;
  int _quantity;
  double _price;
  List _sizes;
  List _colors;
  bool _onSale;
  bool _featured;

  //getters
  String get name => _name;

  String get brand => _brand;

  int get quantity => _quantity;

  double get price => _price;

  List get sizes => _sizes;

  List get colors => _colors;

  bool get onSale => _onSale;

  bool get featured => _featured;
}
