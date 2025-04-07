import 'package:flutter/material.dart';

import 'package:t_store/common/widgets_login_signup/appBar/appbar.dart';
import 'package:t_store/common/widgets_login_signup/products.cart/ratings/rating_indiccator.dart';
import 'package:t_store/features/shop/screens/produtc_reviews/widgets/rating_progress_indicator.dart';
import 'package:t_store/features/shop/screens/produtc_reviews/widgets/user_review_card.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  AppBar
      appBar: TAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),
      //  Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Ratings and reviews are verified and are from people who use the same type of device that you see'),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              //  Overall Product Ratings
              TOverallProductRating(),
              TRatingBarIndicator(rating: 3.5),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),
              //  User review List
              UserReviewCard(),

              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
