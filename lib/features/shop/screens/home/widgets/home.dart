import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets_login_signup/custom_shapes/containers/circular_container.dart';
import 'package:t_store/common/widgets_login_signup/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets_login_signup/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets_login_signup/images/t_rounded_image.dart';
import 'package:t_store/common/widgets_login_signup/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/home/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header

            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //AppBar
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  //Searchbar
                  const TSearchContainer(
                    text: 'Search in Store',
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  //Heading
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        //Categories
                        THomeCategories(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: TPromoSlider(
                banners: [
                  TImages.promBanner1,
                  TImages.promBanner2,
                  TImages.promBanner3
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
