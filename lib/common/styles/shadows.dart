import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class TShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: TColors.darkerGrey.withAlpha(26),
    offset: const Offset(0, 2),
    blurRadius: 50,
    spreadRadius: 7,
  );
  static final hrizontalProductShadow = BoxShadow(
    color: TColors.darkerGrey.withAlpha(26),
    offset: const Offset(0, 2),
    blurRadius: 50,
    spreadRadius: 7,
  );
}
