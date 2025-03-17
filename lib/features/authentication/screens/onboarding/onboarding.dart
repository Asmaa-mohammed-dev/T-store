import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/controllers/onboarding_controller.dart';
import 'package:t_store/features/authentication/screens/widgets/onboarding_dot_navigation.dart';
import 'package:t_store/features/authentication/screens/widgets/onboarding_next_page.dart';
import 'package:t_store/features/authentication/screens/widgets/onboarding_page.dart';
import 'package:t_store/features/authentication/screens/widgets/onboarding_skip.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Center(
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: controller.updatePageIndicator,
                    children: const [
                      OnBoardingPage(
                        image: TImages.onBoardingImage1,
                        title: TTexts.onBoardingTitle1,
                        subTitle: TTexts.onBoardingSubTitle1,
                      ),
                      OnBoardingPage(
                        image: TImages.onBoardingImage2,
                        title: TTexts.onBoardingTitle2,
                        subTitle: TTexts.onBoardingSubTitle2,
                      ),
                      OnBoardingPage(
                        image: TImages.onBoardingImage3,
                        title: TTexts.onBoardingTitle3,
                        subTitle: TTexts.onBoardingSubTitle3,
                      ),
                    ],
                  ),
                ),
              ),
              //skip button
              const OnBoardingSkip(),
              //dont navigation smoothPageIndicator
              const OnBoardingDotNavigation(),
              //Circular Button
              OnBoardingNextButton(),
            ],
          ),
        ),
      ),
    );
  }
}
