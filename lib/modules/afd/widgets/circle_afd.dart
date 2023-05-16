import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../core/theme/app_colors.dart';

class CircleAFD extends StatelessWidget {
  const CircleAFD({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: AppColors.primaryColor,
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            color: AppColors.primaryColor,
          ),
        ),
        child: Text(
          "Qn",
          style: StyleThemes.button.withColor(
            AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
