import 'package:flutter/material.dart';
import 'package:t_store/common/widgets_login_signup/products/cart/cart_item.dart';
import 'package:t_store/common/widgets_login_signup/texts/product_price_text.dart';
import 'package:t_store/features/shop/screens/product_details/cart/add_remove_button.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: TSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          // Cart Icon

          const TCartItem(),
          if (showAddRemoveButtons) SizedBox(height: TSizes.spaceBtwItems),
          // Add remove Button Fow with total Price
          if (showAddRemoveButtons)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Extra space

                    const SizedBox(width: 70),
                    //  Add Remove Buttons
                    TProductQuantityWithAddRemove(),
                  ],
                ),
                TProductPricetext(price: '256')
              ],
            ),
        ],
      ),
    );
  }
}
