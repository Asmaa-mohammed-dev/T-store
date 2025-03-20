import 'package:flutter/material.dart';
import 'package:t_store/common/widgets_login_signup/appBar/appbar.dart';
import 'package:t_store/common/widgets_login_signup/products.cart/cart_menu_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: const Color.fromARGB(255, 243, 243, 243)),
          ),
          Text(
            TTexts.homeAppbarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.white),
          ),
        ],
      ),
      actions: [
        TCartCountericon(
          onPressed: () {},
          iconColor: TColors.white,
        )
      ],
    );
  }
}
