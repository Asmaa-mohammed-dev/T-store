import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart' show TSizes;

///A Widget for displaying on animated loading indicator with optional text and action button
class TAnimationLoaderWidget extends StatelessWidget {
  ///Default constructor for the NAnimationLoaderWidget
  ///parameters:
  ///-text: the text to be displayed below the animation

  ///-animation: the lottie animation to be soon
  ///showAction: Whether to show an action button below the text
  ///actionText: the text to be displayed on the action button
  ///onactionPressed: Callback function to be executed when the action button is pressed
  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });
  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              animation,
              height: 200,
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            const SizedBox(height: TSizes.defaultSpace),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'MAJALLA',
                fontSize: 20,
              ),
            ),
            const SizedBox(height: TSizes.defaultSpace),
            showAction
                ? SizedBox(
                    width: 250,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: TColors.dark,
                      ),
                      onPressed: onActionPressed,
                      child: Text(
                        actionText!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'MAJALLA',
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
