import 'package:chibata_hub/core/shared_components/custom_checkbox.dart';
import 'package:chibata_hub/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CardOtherClass extends StatelessWidget {
  const CardOtherClass({
    super.key,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });
  final int index;
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          border: !isSelected
              ? null
              : Border.all(
                  color: AppColors.primaryColor,
                  width: 2,
                ),
        ),
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/icon_video.png",
                    color: AppColors.primaryColor,
                    height: 50,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Aula ${index + 1}",
                      style: StyleThemes.subtitle.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Transform.scale(
                    scale: 1.5,
                    child: const CustomCheckbox(
                      intialValue: false,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
