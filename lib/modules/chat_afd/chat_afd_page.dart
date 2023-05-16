import 'package:chibata_hub/core/theme/app_colors.dart';
import 'package:chibata_hub/modules/chat_afd/widgets/state_afd_processed.dart';
import 'package:flutter/material.dart';

class ChatAFDPage extends StatelessWidget {
  const ChatAFDPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryColor.withOpacity(.5),
                    ),
                    child: Text(
                      "String: 10101010",
                      style: StyleThemes.body.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Wrap(
                      direction: Axis.horizontal,
                      runSpacing: 10,
                      children: [
                        StateAFDProcessed(),
                        StateAFDProcessed(),
                        StateAFDProcessed(),
                        StateAFDProcessed(),
                        StateAFDProcessed(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Digite uma string para ser processada",
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/icon_video.png",
                    height: 40,
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
