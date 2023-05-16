import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../../core/shared_components/buttons/primary_button.dart';
import '../../../core/shared_components/custom_checkbox.dart';
import '../../../core/theme/app_colors.dart';
import '../../video/video_page.dart';

class DialogAboutClass extends StatelessWidget {
  const DialogAboutClass({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      contentPadding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              "Aula 2",
              style: StyleThemes.subtitle.withColor(
                AppColors.primaryColor,
              ),
            ),
          ),
          CustomCheckbox(
            intialValue: false,
          )
        ],
      ),
      content: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "O que é um objeto? como declarar usando Java?",
            ),
            SizedBox(height: 12),
            SizedBox(
              height: 30,
              width: MediaQuery.of(context).size.width,
              child: PrimaryButton(
                child: Text("Vamos lá"),
                onPressed: () {
                  Get.off(() => VideoPage());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
