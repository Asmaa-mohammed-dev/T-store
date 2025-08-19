import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories.authentication/authentication/t_firebase_auth_exception.dart';
import 'package:t_store/data/repositories.authentication/services/firebase_storage_service.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/enums.colors.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();
  //Firebase instance for database interactions
  final _db = FirebaseFirestore.instance;

  //Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }
  }

  //Upload dummy data to the cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      //Upload all the products along with their images
      final storage = Get.put(TFirebaseStorageService());
      //Loop through each product
      for (var product in products) {
        //Get image data link from local asstes
        final thumbnail = await storage.getImageDataFromAssets(
          product.thumbnail,
        );
        //Upload image and gets its URL
        final url = await storage.uploadImageData(
          'Products/Images',
          thumbnail,
          product.thumbnail.toString(),
        );
        //Assign Url to product.thumbnail attributes
        product.thumbnail = url;
        //Product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageUrl = [];
          for (var image in product.images!) {
            //Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);
            //Upload image and get its URL
            final url = await storage.uploadImageData(
              'Products/Images',
              assetImage,
              image,
            );
            //Assign URL to product.thumbnail attribute
            imageUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imageUrl);
        }
        //Upload Variation Images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            //Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(
              variation.image,
            );
            //Upload image and gets its Url
            final url = await storage.uploadImageData(
              'Products/Images',
              assetImage,
              variation.image,
            );
            //Assign URL to variation.image attribute
            variation.image = url;
          }
        }
        //Store product in firebase
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }
  }
}
