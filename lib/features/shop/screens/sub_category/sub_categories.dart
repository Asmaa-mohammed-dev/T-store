import 'package:flutter/material.dart';
import 'package:t_store/common/widgets_login_signup/appBar/appbar.dart';
import 'package:t_store/common/widgets_login_signup/images/t_rounded_image.dart';
import 'package:t_store/common/widgets_login_signup/products/products_cards/product_card_horizontal.dart';
import 'package:t_store/common/widgets_login_signup/texts/section_heading.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Sports shirts'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              TRoundedImage(
                width: double.infinity,
                imageUrl: TImages.promBanner4,
                applyImageRadius: true,
              ),
              SizedBox(height: TSizes.spaceBtwSections),
              // Sub-Categories
              Column(
                children: [
                  // Heading
                  TSectionHeading(title: 'Sports shirts', onPressed: () {}),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: TSizes.spaceBtwItems),
                        itemBuilder: (context, index) =>
                            TProductCardHorizontal()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
