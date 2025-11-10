import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/shimmer/shimmer.dart';
import 'package:t_store/common/styles/rounded_container.dart';
import 'package:t_store/common/widgets_login_signup/products/products_cards/t_brand_card.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/features/shop/screens/brands/brand_products.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key,
    required this.images, required this.brand,
  });
  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=>Get.to(()=> BrandProducts(brand: brand)),
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.md),
        showBorder: true,
        borderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Column(
          children: [
            //Brand with products Images
            const SizedBox(height: TSizes.spaceBtwItems),
             TBrandCard(showBorder: false, brand:  brand),
            //Bradnd top 3 Product Images
            Row(
              children: images
                  .map((image) => brandTapProductImageWidget(image, context))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget brandTapProductImageWidget(String image, context) {
  return Expanded(
    child: TRoundedContainer(
      height: 100,
      showBorder: false,
      margin: const EdgeInsets.only(right: TSizes.sm),
      backgroundColor: THelperFunctions.isDarkMode(context)
          ? TColors.darkGrey
          : TColors.light,
      child: CachedNetworkImage(imageUrl: image,fit: BoxFit.contain,
      progressIndicatorBuilder: (context, url, downloadProgress) => const TShimmerEffect(width: 100, height: 100),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      )
    ),
  );
}
