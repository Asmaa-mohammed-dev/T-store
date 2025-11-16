import 'package:flutter/material.dart';
import 'package:t_store/common/shimmer/boxes_shimmer.dart';
import 'package:t_store/common/shimmer/list_tile_shimmer.dart';
import 'package:t_store/common/widgets_login_signup/brands/brand_show_case.dart';
import 'package:t_store/features/shop/controllers/products/brand_controller.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_function.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key,required this.category});

final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
//Handle loader, No Record, Or Error Message
const loader = Column(
  children: [
    TListTileShimmer(),
    SizedBox(height: TSizes.spaceBtwItems),
    TBoxesShimmer(),
    SizedBox(height: TSizes.spaceBtwItems)
  ],
);
final widget = TCloudHelperFunctions.checkMultiRecordSate(snapshot: snapshot,loader: loader);
if(widget != null) return widget;
//Record Found!
final brands = snapshot.data!;
return ListView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemCount: brands.length,
  
  itemBuilder: (_,index){
    final brand = brands[index];
        return FutureBuilder(
          future: controller.getBrandProducts(brandId:brand.id,limit:3),
          builder: (context, snapshot) {
           //Handle loader, No Record, Or Error Message
           final widget = TCloudHelperFunctions.checkMultiRecordSate(snapshot: snapshot,loader: loader);
if(widget != null) return widget;
//Record Found!
final products = snapshot.data!;
            return TBrandShowCase(brand: brand,images: products.map((e) => e.thumbnail).toList());
          }
        );

  },

     );
      }
    );
  }
}