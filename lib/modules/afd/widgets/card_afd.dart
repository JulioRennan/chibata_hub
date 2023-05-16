import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../core/theme/app_colors.dart';
import 'circle_afd.dart';

class CardAFD extends StatelessWidget {
  const CardAFD({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 120,
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 5,
              child: InkWell(
                child: Icon(
                  Icons.close,
                  color: Colors.redAccent,
                ),
                onTap: () {},
              ),
            ),
            Positioned(
              bottom: -10,
              right: -5,
              child: Row(
                children: [
                  Text(
                    'QFinal',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Checkbox(
                    value: false,
                    checkColor: Colors.white,
                    activeColor: AppColors.primaryColor,
                    fillColor: MaterialStatePropertyAll(
                      AppColors.primaryColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (_) {},
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
                    "Qn",
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
              child: const CircleAFD(),
            ),
            Positioned(
              bottom: 0,
              left: 170,
              child: const CircleAFD(),
            ),
            Positioned(
              bottom: 82,
              left: 135,
              child: Text(
                "1",
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
