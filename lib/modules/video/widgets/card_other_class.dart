import 'package:chibata_hub/core/shared_components/custom_checkbox.dart';
import 'package:chibata_hub/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CardOtherClass extends StatelessWidget {
  const CardOtherClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
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
                    "Aula 1",
                    style: StyleThemes.subtitle.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Transform.scale(
                  scale: 1.5,
                  child: CustomCheckbox(
                    intialValue: false,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
