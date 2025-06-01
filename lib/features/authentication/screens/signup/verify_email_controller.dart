import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories.authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/login/widgets/success_screen/success_screen.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  ///Send Email Whenever Verify Screen apperas & Set Timer for auto redirect
  @override
  void onInit() {
    sendEmailVertification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  ///Send Email Verification link
  sendEmailVertification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVertification();
      TLoaders.successSnackBar(
        title: 'Email has been sent',
        message: 'Please confirm that the email have recieved to you',
      );
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Something went wrong!', message: e.toString());
    }
  }

  ///Timer to automatically redirect on Email Vertification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SucessScreen(
            image: TImages.successfullyRegisterAnimation,
            title: TTexts.yourAccountCreatedTitle,
            subTitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  ///Manually Check if Email Verified
  checkEmailVertificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SucessScreen(
          image: TImages.successfullyRegisterAnimation,
          title: TTexts.yourAccountCreatedTitle,
          subTitle: TTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
