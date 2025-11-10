import 'package:flutter/material.dart';
import 'package:t_store/common/shimmer/shimmer.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBoxesShimmer extends StatelessWidget {
  const TBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: TShimmerEffect(width: 190, height: 110)),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: TShimmerEffect(width: 190, height: 110)),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: TShimmerEffect(width: 190, height: 110)),
            SizedBox(width: TSizes.spaceBtwItems),
          ],
        ),
      ],
    );
  }
}