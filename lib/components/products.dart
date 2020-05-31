import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  var products_list = [
    {
      'name': 'Blazer',
      'picture': 'images/products/blazer1.jpeg',
      'old_price': 123,
      'price': 87
    },
    {
      'name': 'Dress',
      'picture': 'images/products/dress1.jpeg',
      'old_price': 123,
      'price': 87
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products_list.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return SingleProduct(
          prod_name: products_list[index]['name'],
          prod_picture: products_list[index]['picture'],
          prod_oldprice: products_list[index]['old_price'],
          prod_price: products_list[index]['price'],
        );
      },
    );
  }
}

class SingleProduct extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_oldprice;
  final prod_price;

  SingleProduct(
      {this.prod_name, this.prod_picture, this.prod_oldprice, this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Hero(
          tag: 'prod',
          child: Material(
            child: InkWell(
              onTap: () {},
              child: GridTile(
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      prod_name,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    title: Text(
                      '\$$prod_price',
                      style: TextStyle(
                          color: Colors.amber, fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text(
                      '\$$prod_oldprice',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                child: Image.asset(
                  prod_picture,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
