import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/styles/rounded_container.dart';
import 'package:t_store/common/widgets_login_signup/appBar/appbar.dart';
import 'package:t_store/common/widgets_login_signup/products/cart/coupon_widget.dart';
import 'package:t_store/common/widgets_login_signup/success_screen/success_screen.dart';
import 'package:t_store/features/shop/screens/product_details/cart/checkout/widgets/billing_address_section.dart';
import 'package:t_store/features/shop/screens/product_details/cart/checkout/widgets/billing_amount_section.dart';
import 'package:t_store/features/shop/screens/product_details/cart/checkout/widgets/billing_payment_section.dart';
import 'package:t_store/features/shop/screens/product_details/cart/widgets/cart_items.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';

import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Items in Cart
              const TCartItems(
                showAddRemoveButtons: false,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Coupon Text Field
              TCouponCard(),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Billing Scetion
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    // Pricing
                    TBillingAmountSection(),

                    const SizedBox(height: TSizes.spaceBtwItems),
                    // Divider
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    // Payment Methods
                    const TBillingPaymentSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    // Address
                    const TBillingAddressSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // Checkout Button

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                  image: TImages.staticSuccessIllustration,
                  title: 'Payment Succes!',
                  subTitle: 'Your item will be shipped soon!',
                  onPressed: () => Get.offAll(() => NavigationMenu()),
                )),
            child: Text('Checkout \$256.0')),
      ),
    );
  }
}
