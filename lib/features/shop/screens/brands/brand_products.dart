import 'package:flutter/material.dart';
import 'package:t_store/common/shimmer/vertical_product_shimmer.dart';
import 'package:t_store/common/widgets_login_signup/appBar/appbar.dart';
import 'package:t_store/common/widgets_login_signup/products/products_cards/t_brand_card.dart';
import 'package:t_store/common/widgets_login_signup/products/sortable/sortable_products.dart';
import 'package:t_store/features/shop/controllers/products/brand_controller.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_function.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(brand.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //brand Detail
              TBrandCard(showBorder: true,brand: brand),
              SizedBox(height: TSizes.spaceBtwSections),
              FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {

                  //Handle loader, No Record, Or Error Message
                  const loader = TVerticalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordSate(snapshot: snapshot,loader : loader);
                  if(widget != null) return widget;
                  //Record Found!
                  final brandProducts = snapshot.data!;
                  return TSortableProducts(products: brandProducts,);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
