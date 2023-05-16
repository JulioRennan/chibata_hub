import 'package:chibata_hub/core/domain/entities/afd_entity.dart';
import 'package:chibata_hub/modules/afd/afd_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';

class CircleAFD extends StatelessWidget {
  const CircleAFD({
    super.key,
    required this.afdDepence,
    required this.afdCurrent,
    required this.state,
  });
  final AFDEntity? afdDepence;
  final AFDEntity afdCurrent;
  final String state;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) {
            final controller = Get.find<AFDController>();
            final listAfdsOptions = controller.listAfds.where(
              (element) =>
                  element.state != afdCurrent.state &&
                  element.state != afdDepence?.state,
            );
            if (listAfdsOptions.isEmpty) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Adicione mais automatos para vincular estados",
                  style: StyleThemes.body.withColor(AppColors.primaryColor),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Wrap(
                children: controller.listAfds
                    .where(
                      (element) =>
                          element.state != afdCurrent.state &&
                          element.state != afdDepence?.state,
                    )
                    .map(
                      (afd) => InkWell(
                        onTap: () {
                          controller.setStateString(
                            afd: afdCurrent,
                            afdDestiny: afd,
                            state: state,
                          );
                          Get.back();
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 1,
                            ),
                          ),
                          child: Container(
                            width: 35,
                            height: 35,
                            padding: const EdgeInsets.all(6),
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
                                "Q${afd.state}",
                                style: StyleThemes.button.withColor(
                                  AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          },
        );
      },
      child: Container(
        width: 40,
        height: 40,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            color: afdDepence == null ? Colors.grey : AppColors.primaryColor,
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: afdDepence == null ? Colors.grey : AppColors.primaryColor,
            ),
          ),
          child: Text(
            afdDepence == null ? "+" : "Q${afdDepence!.state}",
            style: StyleThemes.button.withColor(
              afdDepence == null ? Colors.grey : AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
