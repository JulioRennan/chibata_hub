import 'package:chibata_hub/core/shared_components/custom_checkbox.dart';
import 'package:chibata_hub/core/theme/app_colors.dart';
import 'package:chibata_hub/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardOtherClass extends StatelessWidget {
  const CardOtherClass({
    super.key,
    required this.index,
    required this.isSelected,
    required this.onTap,
    required this.uid,
    required this.isVideo,
  });
  final int index;
  final bool isSelected;
  final void Function()? onTap;
  final String uid;
  final bool isVideo;
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
                    isVideo
                        ? "assets/images/icon_video.png"
                        : "assets/images/icon_article.png",
                    color: AppColors.primaryColor,
                    height: isVideo ? 50 : 40,
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
                  GetBuilder<HomeController>(builder: (context) {
                    return Transform.scale(
                      scale: 1.5,
                      child: CustomCheckbox(
                        intialValue: Get.find<HomeController>()
                            .listVideoViewers
                            .contains(uid),
                        onChanged: (newValue) {
                          if (newValue ?? false) {
                            return Get.find<HomeController>().addViewer(uid);
                          }
                          return Get.find<HomeController>().removeViewer(uid);
                        },
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
