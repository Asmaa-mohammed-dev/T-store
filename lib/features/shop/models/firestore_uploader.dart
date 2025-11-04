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

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:t_store/features/shop/controllers/dummy_data.dart';

// class FirestoreUploader {
//   /// 🔹 رفع كل البيانات دفعة واحدة
//   static Future<void> uploadAllDummyData() async {
//     await uploadCategoriesToFirestore();
//     await uploadBrandsToFirestore();
//     await uploadProductsToFirestore();
//     await uploadBannersToFirestore(); 
//     print('🎉✅ All dummy data uploaded successfully!');
//   }

//   /// 🟢 رفع الفئات (Categories)
//   static Future<void> uploadCategoriesToFirestore() async {
//     final firestore = FirebaseFirestore.instance;
//     final categories = TDummyData.categories;

//     for (var category in categories) {
//       await firestore.collection('Categories').doc(category.id).set({
//         'id': category.id,
//         'name': category.name,
//         'image': category.image,
//         'isFeatured': category.isFeatured,
//         'parentId': category.parentId,
//       });
//       print('📁 Uploaded category: ${category.name}');
//     }
//   }

//   /// 🟣 رفع البراندات (Brands)
//   static Future<void> uploadBrandsToFirestore() async {
//     final firestore = FirebaseFirestore.instance;
//     final brands = TDummyData.brands;

//     for (var brand in brands) {
//       await firestore.collection('Brands').doc(brand.id).set({
//         'id': brand.id,
//         'name': brand.name,
//         'image': brand.image,
//         'productsCount': brand.productsCount,
//         'isFeatured': brand.isFeatured,
//       });
//       print('🏷️ Uploaded brand: ${brand.name}');
//     }
//   }

//   /// 🟡 رفع المنتجات (Products)
//   static Future<void> uploadProductsToFirestore() async {
//     final firestore = FirebaseFirestore.instance;
//     final products = TDummyData.products;

//     for (var product in products) {
//       await firestore.collection('Products').doc(product.id).set(product.toJson());
//       print('🛒 Uploaded product: ${product.title}');
//     }
//   }
//   /// 🔵 رفع البانرات (Banners)
// static Future<void> uploadBannersToFirestore() async {
//   final firestore = FirebaseFirestore.instance;
//   final banners = TDummyData.banners;

//   for (var banner in banners) {
//     await firestore.collection('Banners').add({
//       'imageUrl': banner.imageUrl,
//       'targetScreen': banner.targetScreen,
//       'active': banner.active,
//     });
//     print('🎈 Uploaded banner: ${banner.imageUrl}');
//   }}
// }
