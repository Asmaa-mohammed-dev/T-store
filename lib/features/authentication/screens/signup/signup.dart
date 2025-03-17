// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets_login_signup/form_divider.dart';
import 'package:t_store/common/widgets_login_signup/social_buttons.dart';
import 'package:t_store/features/authentication/screens/signup/signup_form.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///title
              Text(TTexts.signUpTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Form
              TSignUpForm(),
              //Divider
              const SizedBox(height: TSizes.spaceBtwSections - 10),

              TFormDivider(dividerText: TTexts.orSignUpwith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections - 10),

              //Social Buttons
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
