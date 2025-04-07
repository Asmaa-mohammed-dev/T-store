import 'package:flutter/material.dart';
import 'package:t_store/common/styles/rounded_container.dart';
import 'package:t_store/common/widgets_login_signup/images/t_circular_inage.dart';
import 'package:t_store/common/widgets_login_signup/texts/product_price_text.dart';
import 'package:t_store/common/widgets_login_signup/texts/product_title_text.dart';
import 'package:t_store/common/widgets_login_signup/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  Price & Sale Price
        Row(
          children: [
//  Sale Tag
            TRoundedContainer(
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
            const SizedBox(width: TSizes.spaceBtwItems),

//  Price
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            TProductPricetext(
              price: '175',
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        //  Title
        const TProductTitleText(title: 'Green Sports shoe'),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        //  Stack Status
        Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: TSizes.spaceBtwItems / 1.5),
          ],
        ),

        //  Brand
        Row(
          children: [
            TCircularImage(
                image: TImages.sportIcon,
                width: 32,
                height: 32,
                overlayColor: darkMode ? TColors.white : TColors.black),
            TBrandTitleWithVertification(
              title: 'Stabraq',
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
