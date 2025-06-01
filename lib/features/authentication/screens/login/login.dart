import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/styles/spacing_style.dart';
import 'package:t_store/common/widgets_login_signup/form_divider.dart';
import 'package:t_store/common/widgets_login_signup/social_buttons.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingAppBarHeight,
          child: Column(
            children: [
              ///Logo, Title&Sub-Title
              TLoginHeader(dark, context),

              ///Form

              TLoginForm(),
              // Divider
              TFormDivider(dividerText: TTexts.orSignInwith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Footer
              TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
