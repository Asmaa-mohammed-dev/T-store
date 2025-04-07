import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/screens/signup/signup.dart';
import 'package:t_store/features/password_configuration/forget_password.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),
            // Remeber Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                      activeColor: TColors.primary,
                    ),
                    const Text(TTexts.rememberMe),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => Get.to(() => ForgetPassword()),
                  child: Text(
                    TTexts.forgetPassword,
                    selectionColor: TColors.primary,
                    style: TextStyle(color: TColors.primary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            // Sign In button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                // onPressed: () => Get.to(() => NavigationMenu()),
                onPressed: () => Get.offAll(() => NavigationMenu()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.primary, // لون الزر أزرق
                ),
                child: Text(TTexts.signIn),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            SizedBox(
              width: double.infinity,
              height: TSizes.appBarHeight,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // التحكم في الانحناء
                  ),
                  foregroundColor: TColors.primary,
                ),
                onPressed: () => Get.to(() => SignUpScreen()),
                child: Text(TTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
