import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:t_store/common/styles/spacing_style.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class SucessScreen extends StatelessWidget {
  const SucessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });
  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingAppBarHeight,
          child: Column(
            children: [
              ///Image
              Lottie.asset(
                image,
                width: MediaQuery.of(context).size.width * 0.6,
              ),

              SizedBox(height: TSizes.spaceBtwSections),

              ///Title & SubTitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: TSizes.spaceBtwItems - 15),

              SizedBox(height: TSizes.spaceBtwSections - 15),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: TSizes.spaceBtwSections - 15),
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.primary, // لون الزر أزرق
                ),
                child: const Text(TTexts.tContinue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
