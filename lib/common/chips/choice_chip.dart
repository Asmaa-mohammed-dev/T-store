import 'package:flutter/material.dart';
import 'package:t_store/common/widgets_login_signup/custom_shapes/containers/circular_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(text);
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor != null ? SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        avatar: isColor != null
            ? TCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: THelperFunctions.getColor(text)!,
              )
            : null,
        shape: isColor != null ? CircleBorder() : null,
        labelPadding: isColor != null ? EdgeInsets.all(0) : null,
        padding: isColor != null ? EdgeInsets.all(0) : null,
        selectedColor:
            isColor != null ? THelperFunctions.getColor(text)! : null,
        backgroundColor:
            isColor != null ? THelperFunctions.getColor(text)! : null,
      ),
    );
  }
}
