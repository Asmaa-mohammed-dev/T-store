import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/loaders/animation_loader.dart';
import 'package:t_store/utils/constants/colors.dart';

///A Utility class for managing a full-screen loading dialog
class TFullScreenLoader {
  ///Open a full-screen loading dialog with a given text and animation
  ///this method doesn't return anything
  ///
  ///parameters:
  ///-text: the text to be displayed in the loading dialog
  ///-animation: the lottie animation to be soon
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: TAnimationLoaderWidget(
                  text: text,
                  animation: animation,
                  // 'assets/animation/loading.json'
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///Stop the currently open loading dialog
  ///This method doesn't return anything
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
