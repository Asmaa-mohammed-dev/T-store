import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories.authentication/authentication/t_firebase_auth_exception.dart';
import 'package:t_store/features/shop/models/brand_model.dart';

class BrandRepository extends GetxController {
static BrandRepository get instance => Get.find();
//Variables
final _db = FirebaseFirestore.instance;
//Get all categories
Future<List<BrandModel>> getAllBrands() async{
    try{
        final snapshot = await _db.collection('Brands').get();
        final result = snapshot.docs.map((e) =>BrandModel.fromSnapshot(e)).toList();
        return result;

    }on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
}
//Get Brands for category

}