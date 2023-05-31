import 'package:chibata_hub/core/shared_components/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

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
            child: PrimaryButton(
              child: Text(
                'Marcar como concluido',
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
