import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Image
            Image(
              image: AssetImage(TImages.deliveredEmailIllustration),
              width: THelperFunctions.screenWidth() * 0.7,
            ),
            const SizedBox(height: TSizes.spaceBtwSections - 20),
            //Title & SubTitle
            Text(TTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: TSizes.spaceBtwSections - 20),
            Text(
              TTexts.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            //Buttons
            const SizedBox(height: TSizes.spaceBtwSections - 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(TTexts.done),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections - 10),
          ],
        ),
      ),
    );
  }
}
