import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/layouts/grid_layout.dart';
import 'package:t_store/common/shimmer/brands_shimmer.dart';
import 'package:t_store/common/widgets_login_signup/appBar/appbar.dart';
import 'package:t_store/common/widgets_login_signup/products/products_cards/t_brand_card.dart';
import 'package:t_store/common/widgets_login_signup/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/products/brand_controller.dart';
import 'package:t_store/features/shop/screens/brands/brand_products.dart';

import 'package:t_store/utils/constants/sizes.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;

    return Scaffold(
      appBar: TAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Heading
              TSectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              SizedBox(height: TSizes.spaceBtwItems),
              //Brands
              Obx(
                       (){
                        if(brandController.isLoading.value) return TBrandsShimmer();
                        if(brandController.allBrands.isEmpty){
                          return Center(
                            child: Text('No Data Found!',style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white))
                          );
                        }
                        return  TGridLayout(
                          mainAxisExtent: 80,
                          itemCount: brandController.allBrands.length,
                          itemBuilder: (_, index) {
                            final brand = brandController.allBrands[index];
                            return TBrandCard(showBorder: true, brand: brand, 
                             onTap: () => Get.to(() => BrandProducts(brand: brand)),
                         );
                          },
                        );
                       }
                       
                      ),
            ],
          ),
        ),
      ),
    );
  }
}
