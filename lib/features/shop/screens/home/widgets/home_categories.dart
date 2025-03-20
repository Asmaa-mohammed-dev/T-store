import 'package:flutter/material.dart';
import 'package:t_store/common/widgets_login_signup/image_text_widgets/vertical_image_text.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalcallmageText(
            image: TImages.sportIcon,
            title: 'shoes',
            onTap: () {},
          );
        },
      ),
    );
  }
}
