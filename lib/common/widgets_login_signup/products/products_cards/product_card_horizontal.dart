import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/styles/rounded_container.dart';
import 'package:t_store/common/widgets_login_signup/images/t_rounded_image.dart';
import 'package:t_store/common/widgets_login_signup/products/favorite_icon/favorite_icon.dart';
import 'package:t_store/common/widgets_login_signup/texts/product_price_text.dart';
import 'package:t_store/common/widgets_login_signup/texts/product_title_text.dart';
import 'package:t_store/common/widgets_login_signup/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:t_store/features/shop/controllers/products/product_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key, required this.product});

  final ProductModel product;


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
        final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
        print('IMAGE URL1 => ${product.thumbnail}');
    return Container(
      //Container with side paddings, color, edges, radius and shadow
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.softGrey,
      ),
      child: Row(
        children: [
          //Thumbnail
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                //Thumanil
                
                SizedBox(
                  height: 120,
                  width: 120,
                  
                  child: TRoundedImage(
                    imageUrl: product.thumbnail,
                    applyImageRadius: true,
                    isNetworkImage: true,
                  ),
                ),

                //sale Tag
                if(salePercentage != null)
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withAlpha(204),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      '25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.black),
                    ),
                  ),
                ),
                //Favourite Icon Button
                Positioned(
                  top: 0,
                  right: 0,
                  child: TFavouriteIcon(productId: product.id),
                ),
              ],
            ),
          ),
          //Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(
                        title: product.title,
                        smallSize: true,
                      ),
                      SizedBox(height: TSizes.spaceBtwItems / 2),
                      TBrandTitleWithVertification(title: product.brand!.name)
                    ],
                  ),
                  Spacer(),
                 //Price Row
                  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Price
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: TSizes.sm),
                          child: Text(product.price.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(
                                      decoration: TextDecoration.lineThrough)),
                        ),
                      //Price,show sale price as main price if sale exist
                      Padding(
                        padding: const EdgeInsets.only(left: TSizes.sm),
                        child: TProductPricetext(
                            price: controller.getProductPrice(product)),
                      ),
                    ],
                  ),
                ),
                 //Add to Cart Button
                Container(
                  decoration: const BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: SizedBox(
                    width: TSizes.iconLg * 1.2,
                    height: TSizes.iconLg * 1.2,
                    child: Center(
                      child: const Icon(Iconsax.add, color: TColors.white),
                    ),
                  ),
                 
                ),
              ],
            ),
                ],
              ),
            ),
          ),
          //
        ],
      ),
    );
  }
}
