import 'package:chibata_hub/core/domain/entities/afd_entity.dart';
import 'package:chibata_hub/core/shared_components/custom_checkbox.dart';
import 'package:chibata_hub/modules/afd/afd_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import 'circle_afd.dart';

class CardAFD extends StatelessWidget {
  const CardAFD({
    super.key,
    required this.afd,
  });
  final AFDEntity afd;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 5,
              child: InkWell(
                child: const Icon(
                  Icons.close,
                  color: Colors.redAccent,
                ),
                onTap: () => Get.find<AFDController>().removeAFD(afd),
              ),
            ),
            Positioned(
              bottom: -10,
              right: -5,
              child: Row(
                children: [
                  const Text(
                    'QFinal',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  CustomCheckbox(
                    intialValue: afd.isFinal,
                    onChanged: (value) {
                      afd.isFinal = value ?? false;
                    },
                  )
                ],
              ),
            ),
            Positioned(
              top: 20,
              child: Container(
                width: 60,
                height: 60,
                padding: EdgeInsets.all(6),
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
            Positioned(
              top: 0,
              left: 170,
              child: CircleAFD(
                afdDepence: afd.when0,
                afdCurrent: afd,
                state: '0',
              ),
            ),
            Positioned(
              bottom: 0,
              left: 170,
              child: CircleAFD(
                afdDepence: afd.when1,
                afdCurrent: afd,
                state: '1',
              ),
            ),
            Positioned(
              bottom: 82,
              left: 135,
              child: Text(
                "0",
                style: StyleThemes.button,
              ),
            ),
            Positioned(
              bottom: 22,
              left: 135,
              child: Text(
                "1",
                style: StyleThemes.button,
              ),
            ),
            Positioned(
              top: 50,
              left: 60,
              child: Container(
                width: 50,
                height: 2,
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 20,
              left: 110,
              child: Container(
                width: 2,
                height: 60,
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 80,
              left: 110,
              child: Container(
                width: 50,
                height: 2,
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 20,
              left: 110,
              child: Container(
                width: 50,
                height: 2,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
