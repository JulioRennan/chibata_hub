import 'package:chibata_hub/modules/courses/article_page.dart';
import 'package:chibata_hub/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/shared_components/buttons/primary_button.dart';
import '../../../core/shared_components/custom_checkbox.dart';
import '../../../core/theme/app_colors.dart';
import '../../video/video_page.dart';

class DialogAboutClass extends StatelessWidget {
  const DialogAboutClass({
    super.key,
    required this.title,
    required this.message,
    required this.isVideo,
    required this.link,
    required this.annotations,
    required this.index,
    required this.uid,
  });
  final String title;
  final String message;
  final bool isVideo;
  final String link;
  final String annotations;
  final int index;
  final String uid;
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
              title,
              style: StyleThemes.subtitle.withColor(
                AppColors.primaryColor,
              ),
            ),
          ),
          GetBuilder<HomeController>(
            builder: (context) {
              return CustomCheckbox(
                intialValue:
                    Get.find<HomeController>().listVideoViewers.contains(uid),
                onChanged: (value) {
                  if (value ?? false) {
                    return Get.find<HomeController>().addViewer(uid);
                  }
                  return Get.find<HomeController>().removeViewer(uid);
                },
              );
            },
          )
        ],
      ),
      content: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
            SizedBox(height: 12),
            SizedBox(
              height: 30,
              width: MediaQuery.of(context).size.width,
              child: PrimaryButton(
                child: Text("Vamos lá"),
                onPressed: () {
                  if (isVideo) {
                    Get.off(
                      () => VideoPage(
                        annotations: annotations,
                        linkVideo: link,
                        index: index,
                      ),
                    );
                  } else {
                    Get.off(
                      () => ArticlePage(
                        link: link,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
