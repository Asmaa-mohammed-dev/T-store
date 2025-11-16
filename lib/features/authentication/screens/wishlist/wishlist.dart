import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/layouts/grid_layout.dart';
import 'package:t_store/common/loaders/animation_loader.dart';
import 'package:t_store/common/shimmer/vertical_product_shimmer.dart';
import 'package:t_store/common/widgets_login_signup/appBar/appbar.dart';
import 'package:t_store/common/widgets_login_signup/icons/t_circular_icon.dart';
import 'package:t_store/common/widgets_login_signup/products/products_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/controllers/products/favourites_controller.dart';
import 'package:t_store/features/shop/screens/home/widgets/home.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_function.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: TAppBar(
        title:
            Text('WishList', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx( ()=>
            FutureBuilder(
                future: controller.favoriteProducts(),
                builder: (context, snapshot) {
              
              //Nothing Found Widget
              final emptyWidget = TAnimationLoaderWidget(
                text: 'Whoops! WishList isEmpty ...',
                animation: TImages.writingpen,
                showAction: true,
                actionText: 'Lets\'s add some ',
                onActionPressed: () =>Get.off(() => const NavigationMenu()),
              );
                  const loader= TVerticalProductShimmer(itemCount: 6,);
              final widget = TCloudHelperFunctions.checkMultiRecordSate(snapshot: snapshot,loader: loader,nothingFound: emptyWidget);
              if(widget != null) return widget;
              final products = snapshot.data!;
                  return TGridLayout(
                      itemCount: products.length,
                      itemBuilder: (_, index) =>
                          TProductCardVertical(product: products[index]));
                }
              ),
          ),
          ),
        ),
      
    );
  }
}
