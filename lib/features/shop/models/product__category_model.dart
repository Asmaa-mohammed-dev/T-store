import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel {
  final String brandId;
  final String categoryId;
  ProductCategoryModel({required this.categoryId, required this.brandId,
  });
  Map<String, dynamic> toJson(){
    return {
      'brandId': brandId,
      'categoryId': categoryId,

    };

  }
  factory ProductCategoryModel.fromSnapshot(DocumentSnapshot snapshot){
    final data = snapshot.data() as Map<String, dynamic>;
    return ProductCategoryModel(categoryId: data['categoryId'] as String, brandId: data['brandId'] as String,     
    );
  }
}