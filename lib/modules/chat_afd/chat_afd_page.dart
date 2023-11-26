import 'package:chibata_hub/core/theme/app_colors.dart';
import 'package:chibata_hub/modules/chat_afd/%20chat_afd_controller.dart';
import 'package:chibata_hub/modules/chat_afd/widgets/state_afd_processed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ChatAFDPage extends StatelessWidget {
  ChatAFDPage({super.key});
  final controller = Get.put(ChatAFDController());
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder(
        init: controller,
        builder: (context) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  reverse: true,
                  children: controller.listChatOperation
                      .map((chatOperation) => Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        AppColors.primaryColor.withOpacity(.5),
                                  ),
                                  child: Text(
                                    "String: ${chatOperation.stringToProcess}",
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Wrap(
                                        direction: Axis.horizontal,
                                        runSpacing: 10,
                                        children: List.generate(
                                          chatOperation.listSteps.length,
                                          (index) => StateAFDProcessed(
                                            hasError: chatOperation
                                                .listSteps[index].isError,
                                            currentStepIsFinal: chatOperation
                                                .listSteps[index].isFinal,
                                            isLast: chatOperation
                                                .listSteps[index].isFinal,
                                            chatProcessed: chatOperation
                                                .listSteps[index].state,
                                            stepState: chatOperation
                                                        .listSteps[index]
                                                        .stepAFD
                                                        .state ==
                                                    -1
                                                ? 'E'
                                                : chatOperation.listSteps[index]
                                                    .stepAFD.state
                                                    .toString(),
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                          height: 32,
                                          color: AppColors.primaryColor),
                                      Row(
                                        children: [
                                          const Text('Estado inicial '),
                                          Image.asset(
                                            "assets/images/arrow_image.png",
                                            width: 35,
                                          ),
                                          SizedBox(width: 10),
                                          Builder(builder: (context) {
                                            final firstAFD =
                                                controller.listAFDs.firstOrNull;
                                            if (firstAFD == null) {
                                              return Row(
                                                children: [
                                                  Icon(Icons.close),
                                                  Text('Nenhum'),
                                                ],
                                              );
                                            }
                                            return Container(
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
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                                ),
                                                child: Text(
                                                  "Q${firstAFD.state}",
                                                  style: StyleThemes.button
                                                      .withColor(
                                                    AppColors.primaryColor,
                                                  ),
                                                ),
                                              ),
                                            );
                                          })
                                        ],
                                      ),
                                      SizedBox(height: 16),
                                      Row(
                                        children: [
                                          const Text('Estado final '),
                                          Image.asset(
                                            "assets/images/arrow_image.png",
                                            width: 35,
                                          ),
                                          SizedBox(width: 10),
                                          Builder(builder: (context) {
                                            final finalAFds = controller
                                                .listAFDs
                                                .where((element) =>
                                                    element.isFinal);

                                            if (finalAFds.isEmpty) {
                                              return Row(
                                                children: [
                                                  Icon(Icons.close),
                                                  Text('Nenhum'),
                                                ],
                                              );
                                            }
                                            return Wrap(
                                              children: finalAFds
                                                  .map((finalAfd) => Container(
                                                        width: 35,
                                                        height: 35,
                                                        margin: EdgeInsets.only(
                                                          right: 10,
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(6),
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            color: AppColors
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.white,
                                                            border: Border.all(
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                          ),
                                                          child: Text(
                                                            "Q${finalAfd.state}",
                                                            style: StyleThemes
                                                                .button
                                                                .withColor(
                                                              AppColors
                                                                  .primaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ))
                                                  .toList(),
                                            );
                                          })
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textEditingController,
                        decoration: const InputDecoration(
                          hintText: "Digite uma string para ser processada",
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(
                              r'1|0',
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        if (textEditingController.text.isEmpty) return;
                        controller.execString(textEditingController.text);
                        textEditingController.text = '';
                      },
                      child: Image.asset(
                        "assets/images/icon_video.png",
                        height: 40,
                        color: AppColors.primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
