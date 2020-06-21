import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppy/components/products.dart';
import 'package:shoppy/main.dart';
import 'package:shoppy/pages/home.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_picture;
  final product_detail_oldprice;
  final product_detail_price;

  ProductDetails(
      {this.product_detail_name,
      this.product_detail_picture,
      this.product_detail_oldprice,
      this.product_detail_price});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.amber,
          centerTitle: true,
          title: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text('Shoppy')),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: null),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 300,
              color: Colors.black,
              child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(widget.product_detail_picture),
                ),
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      widget.product_detail_name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          '\$ ${widget.product_detail_oldprice}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough),
                        )),
                        Expanded(
                            child: Text(
                          '${widget.product_detail_price}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //the first button
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text('Size')),
                          Expanded(child: Icon(Icons.arrow_drop_down))
                        ],
                      ),
                      color: Colors.white,
                      textColor: Colors.grey,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Size'),
                                content: Text('Choose a size'),
                                actions: <Widget>[
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'close',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  )
                                ],
                              );
                            });
                      }),
                ),
                Expanded(
                  child: MaterialButton(
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text('Qte')),
                          Expanded(child: Icon(Icons.arrow_drop_down))
                        ],
                      ),
                      color: Colors.white,
                      textColor: Colors.grey,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Color'),
                                content: Text('Choose a color'),
                                actions: <Widget>[
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'close',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  )
                                ],
                              );
                            });
                      }),
                ),
                Expanded(
                  child: MaterialButton(
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text('Color')),
                          Expanded(child: Icon(Icons.arrow_drop_down))
                        ],
                      ),
                      color: Colors.white,
                      textColor: Colors.grey,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Quanitity'),
                                content: Text('Choose a quantity'),
                                actions: <Widget>[
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'close',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  )
                                ],
                              );
                            });
                      }),
                ),
              ],
            ),
            // second buttons
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            'Buy',
                            textAlign: TextAlign.center,
                          )),
                        ],
                      ),
                      color: Colors.amber,
                      elevation: 0.2,
                      textColor: Colors.white,
                      onPressed: () {}),
                ),
                IconButton(
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.amber,
                    ),
                    onPressed: null),
                IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.amber,
                    ),
                    onPressed: null)
              ],
            ),
            Divider(),
            ListTile(
              title: Text('Product details'),
              subtitle: Text(
                  'The job listing states that you are looking for someone with patience and superior communication skills. While volunteering and holding an office for the Special Olympics, I learned how to be patient with the athletes and participants at our state’s Special Olympics. Coordinating the event helped me develop better communication '
                  'and planning skills which are imperative when performing the responsibilities you described today. '),
            ),
            Divider(),
            Row(
              children: <Widget>[
                Padding(
                    child: Text(
                      'Product name: ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    padding: EdgeInsets.fromLTRB(12, 5, 5, 5)),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(widget.product_detail_name),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                    child: Text(
                      'Product brand: ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    padding: EdgeInsets.fromLTRB(12, 5, 5, 5)),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text('Brand X'),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                    child: Text(
                      'Product condition: ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    padding: EdgeInsets.fromLTRB(12, 5, 5, 5)),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text('NEW'),
                ),
              ],
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Similar  products',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.orange),
              ),
            ),
            Container(
              height: 320,
              child: Similar_Products(),
            )
          ],
        ));
  }
}

class Similar_Products extends StatefulWidget {
  @override
  _Similar_ProductsState createState() => _Similar_ProductsState();
}

class _Similar_ProductsState extends State<Similar_Products> {
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
        return SimiluarSingleProduct(
          prod_name: products_list[index]['name'],
          prod_picture: products_list[index]['picture'],
          prod_oldprice: products_list[index]['old_price'],
          prod_price: products_list[index]['price'],
        );
      },
    );
  }
}

class SimiluarSingleProduct extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_oldprice;
  final prod_price;

  SimiluarSingleProduct(
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
                          fontSize: 24),
                    )),
                    Text(
                      '\$ ${prod_price}',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
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
