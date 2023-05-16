import 'package:chibata_hub/core/theme/app_colors.dart';
import 'package:chibata_hub/modules/afd/widgets/card_afd.dart';
import 'package:chibata_hub/modules/chat_afd/chat_afd_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'widgets/circle_afd.dart';

class AFDPage extends StatelessWidget {
  const AFDPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                  color: Colors.grey,
                )
              ],
            ),
            child: SafeArea(
              child: SizedBox(
                height: 90,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Autômatos Finitos Determinístico',
                          textAlign: TextAlign.center,
                          style: StyleThemes.body.withColor(
                            AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: AppColors.primaryColor,
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
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
                                    SizedBox(height: 4),
                                    Text(
                                      "Adicionar",
                                      style: StyleThemes.button
                                          .withColor(Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => ChatAFDPage());
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/icon_video.png",
                                      width: 50,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "Executar",
                                      style: StyleThemes.button
                                          .withColor(Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                CardAFD(),
                SizedBox(height: 10),
                CardAFD(),
                SizedBox(height: 10),
                CardAFD(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
