import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/layouts/grid_layout.dart';
import 'package:t_store/common/widgets_login_signup/products/products_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/controllers/all_products_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key, required this.products,
  });
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    //Initialize controller for managing product sorting
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        //Dropdown
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          items: [
            'Name',
            'Higher Price',
            'lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
          onChanged: (value) {
              //Sort products based on the selected option
          controller.sortProducts(value!);
          },
        
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        //Products
        Obx(
         ()=> TGridLayout(
              itemCount: controller.products.length,
              itemBuilder: (_, index) =>
                  TProductCardVertical(product: controller.products[index])),
        )
      ],
    );
  }
}
