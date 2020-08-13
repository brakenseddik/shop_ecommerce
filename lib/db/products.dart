import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppy/models/product.dart';

class ProductsService {
  Firestore _firestore = Firestore.instance;
  String ref = 'products';

  Future<List<Product>> getFeaturedProducts() => _firestore
          .collection(ref)
          .where('featured', isEqualTo: true)
          .getDocuments()
          .then((snap) {
        List<Product> featuredProducts = [];
        snap.documents.map((value) {
          featuredProducts.add(Product.fromSnapshot(value));
        });
        return featuredProducts;
      });
}
