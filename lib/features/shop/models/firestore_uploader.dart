import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/shop/controllers/dummy_data.dart';

class FirestoreUploader {
  static Future<void> uploadProductsToFirestore() async {
    final products = TDummyData.products;
    final firestore = FirebaseFirestore.instance;

    for (var product in products) {
      await firestore
          .collection('Products')
          .doc(product.id)
          .set(product.toJson());
      print('✅ Uploaded: ${product.title}');
    }

    print('🎉 All products uploaded.');
  }
}
