import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppy/pages/product_details.dart';
import 'package:shoppy/utils/package.dart';

class Products extends StatelessWidget {
  var products_list = [
    {
      'name': 'Black Blazer',
      'picture': 'images/products/blazer1.jpeg',
      'old_price': 145,
      'price': 87
    },
    {
      'name': 'Black Blazer',
      'picture': 'images/products/blazer2.jpeg',
      'old_price': 123,
      'price': 87
    },
    {
      'name': 'Hills boi',
      'picture': 'images/products/hills1.jpeg',
      'old_price': 123,
      'price': 87
    },
    {
      'name': 'Hills boi',
      'picture': 'images/products/hills2.jpeg',
      'old_price': 123,
      'price': 87
    },
    {
      'name': 'red skirt',
      'picture': 'images/products/skt1.jpeg',
      'old_price': 98,
      'price': 44
    },
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
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetails(
                      //Passing the values from products list to product detail page
                      product_detail_name: prod_name,
                      product_detail_picture: prod_picture,
                      product_detail_oldprice: prod_oldprice,
                      product_detail_price: prod_price,
                    ))),
            child: GridTile(
              footer: Container(
                color: Colors.white,
                height: 50,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      prod_name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
                    Text(
                      '\$ ${prod_price}',
                      style: TextStyle(
                          color: deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )
                  ],
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
    );
  }
}
