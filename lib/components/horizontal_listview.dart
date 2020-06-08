import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class horizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image: 'images/cats/tshirt.png',
            caption: 'T-shirt',
          ),
          Category(
            image: 'images/cats/jeans.png',
            caption: 'Jeans',
          ),
          Category(
            image: 'images/cats/shoe.png',
            caption: 'Shoes',
          ),
          Category(
            image: 'images/cats/informal.png',
            caption: 'Informal',
          ),
          Category(
            image: 'images/cats/dress.png',
            caption: 'Dresses',
          ),
          Category(
            image: 'images/cats/formal.png',
            caption: 'Formal',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image;
  final String caption;
  Category({this.image, this.caption});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red, //                   <--- border color
                width: 3.0,
              ),
              color: Colors.yellow.withOpacity(0.5),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          //width: 100.0,
          child: Column(
            children: <Widget>[
              Image.asset(
                image,
                width: 100,
                height: 70,
              ),
              Text(caption),
            ],
          ),
        ),
      ),
    );
  }
}
