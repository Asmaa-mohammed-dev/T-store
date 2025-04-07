import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCircularIcon extends StatelessWidget {
  //A Custom Circular Icon Widget with a background color
  //Properties are
  ///Container [width], [height] and [backgroundcolor]
  ///Icon's [size] and [color]  and [onPressed] function
  const TCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = TSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });
  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ??
            (isDarkMode
                ? TColors.black.withAlpha(230) // اللون الداكن
                : TColors.white.withAlpha(230)),
        borderRadius: BorderRadius.circular(200),
      ),
      child: IconButton(
          onPressed: () {}, icon: Icon(icon, color: color, size: size)),
    );
  }
}
