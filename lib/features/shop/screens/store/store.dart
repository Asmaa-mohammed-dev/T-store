import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/appbar/Tappbar.dart';
import 'package:t_store/common/layouts/grid_layout.dart';
import 'package:t_store/common/shimmer/brands_shimmer.dart';
import 'package:t_store/common/widgets_login_signup/appBar/appbar.dart';
import 'package:t_store/common/widgets_login_signup/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets_login_signup/products.cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets_login_signup/products/products_cards/t_brand_card.dart';
import 'package:t_store/common/widgets_login_signup/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/controllers/products/brand_controller.dart';
import 'package:t_store/features/shop/screens/brands/all_brands.dart';
import 'package:t_store/features/shop/screens/brands/brand_products.dart';
import 'package:t_store/features/shop/screens/home/widgets/categorytab.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCountericon(iconColor: TColors.darkerGrey, onPressed: () {})
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      // Search bar
                      SizedBox(height: TSizes.spaceBtwItems),
                      TSearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero),
                      SizedBox(height: TSizes.spaceBtwSections),
                      // Feautured brands
                      TSectionHeading(
                          title: 'Feautured Brands',
                          showActionButton: true,
                          onPressed: () =>
                              Get.to(() => const AllBrandScreen())),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                      Obx(
                       (){
                        if(brandController.isLoading.value) return TBrandsShimmer();
                        if(brandController.featuredBrands.isEmpty){
                          return Center(
                            child: Text('No Data Found!',style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white))
                          );
                        }
                        return  TGridLayout(
                          mainAxisExtent: 80,
                          itemCount: brandController.featuredBrands.length,
                          itemBuilder: (_, index) {
                            final brand = brandController.featuredBrands[index];
                            return TBrandCard(showBorder: true, brand: brand,onTap: ()=> Get.to(()=> BrandProducts(brand: brand)));
                          },
                        );
                       }
                       
                      ),
                    ],
                  ),
                ),
                // Tabs
                bottom: TTabBar(
                  tabs: categories
                      .map((category) => Tab(child: Text(category.name)))
                      .toList(),
              
                  //   Tab(child: Text('mersal')),
                  // ]
                ),
              ),
            ];
          },
          // body
          body: TabBarView(
            children: categories
                .map((category) => TCategoryTab(category: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}
