import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets_login_signup/icons/t_circular_icon.dart';
import 'package:t_store/features/shop/controllers/products/favourites_controller.dart';
import 'package:t_store/utils/constants/colors.dart';

class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({super.key, required this.productId});

final String productId;
  @override
  Widget build(BuildContext context) {

    // final controller = Get.put(FavouritesController());
    final controller = FavouritesController.instance;

     return Obx(
       ()=> TCircularIcon(
        icon: controller.isFavourite(productId) ? Iconsax.heart5: Iconsax.heart,
          color:controller.isFavourite(productId) ? TColors.error : null,
           onPressed: () {
      controller.toggleFavoriteProduct(productId);
      print("Pressed $productId");  
           },
      ),
     );

  }
}