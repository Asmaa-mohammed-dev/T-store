import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:t_store/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();
  //variable
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  //update current Index when page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;
  // Jump to the

  // Jump to the specific dot selected page

  void dotNavigationClick(index) {
    // Update current Index & jump to next page
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();

      if (kDebugMode) {
        print('============= Get Storage Auth ===========');
        print(storage.read('IsFirstTime'));
      }

      storage.write('IsFirstTime', false);
      if (kDebugMode) {
        print('============= Get Storage next button ===========');
        print(storage.read('IsFirstTime'));
      }
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }
  // Update Current Index& jump to the last page

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
