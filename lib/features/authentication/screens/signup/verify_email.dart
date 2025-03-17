import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets_login_signup/success_screen/success_screen.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Image
              Image(
                image: AssetImage(TImages.deliveredEmailIllustration),
                width: THelperFunctions.screenWidth() * 0.7,
              ),
              const SizedBox(
                  height: TSizes.spaceBtwSections - 20), //Title & SubTitle
              Text(TTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwSections - 20),
              Text(
                'supporting@codingwithA.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections - 20),
              Text(
                TTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              //Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => SuccessScreen(
                        image: TImages.staticSuccessIllustration,
                        title: TTexts.yourAccountCreatedTitle,
                        subTitle: TTexts.yourAccountCreatedSubTitle,
                        onPressed: () => Get.offAll(() => LoginScreen()),
                      )),
                  child: const Text(TTexts.tContinue),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections - 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(TTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
