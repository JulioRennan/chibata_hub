import 'package:chibata_hub/core/shared_components/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../home/home_controller.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({
    super.key,
    required this.link,
  });
  final String link;

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late final homeController = Get.find<HomeController>();
  late final currentVideo = homeController.listClasses
      .where(
        (element) => element['link'] == widget.link,
      )
      .first;
  late final controller = WebViewController()
    ..loadRequest(Uri.parse(widget.link));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: WebViewWidget(
              controller: controller,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: GetBuilder<HomeController>(
              builder: (context) {
                return PrimaryButton(
                  child: Text(
                    isViewed
                        ? 'Desmarcar como concluído'
                        : 'Marcar como concluído',
                  ),
                  onPressed: () async {
                    if (!isViewed) {
                      await homeController.addViewer(currentVideo['id']);
                    } else {
                      await homeController.removeViewer(currentVideo['id']);
                    }
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  bool get isViewed =>
      homeController.listVideoViewers.contains(currentVideo['id']);
}
