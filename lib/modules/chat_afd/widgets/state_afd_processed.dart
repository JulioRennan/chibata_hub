import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class StateAFDProcessed extends StatelessWidget {
  const StateAFDProcessed({
    super.key,
    required this.chatProcessed,
    required this.stepState,
    required this.isLast,
    required this.currentStepIsFinal,
    required this.hasError,
  });
  final String chatProcessed;
  final String stepState;
  final bool isLast;
  final bool currentStepIsFinal;
  final bool hasError;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 35,
            height: 35,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: hasError ? Colors.redAccent : AppColors.primaryColor,
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: hasError ? Colors.redAccent : AppColors.primaryColor,
                ),
              ),
              child: Text(
                "Q$stepState",
                style: StyleThemes.button.withColor(
                  hasError ? Colors.redAccent : AppColors.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(width: 4),
          if (isLast)
            Center(
              child: Icon(
                hasError ? Icons.close : Icons.check_outlined,
                size: 18,
                color: hasError ? Colors.redAccent : Colors.green,
              ),
            ),
          if (!isLast)
            Column(
              children: [
                Text(chatProcessed),
                Image.asset(
                  "assets/images/arrow_image.png",
                  width: 35,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
