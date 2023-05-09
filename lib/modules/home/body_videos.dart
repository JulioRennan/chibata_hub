import 'package:chibata_hub/modules/home/courses_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'widgets/card_items.dart';

class BodyVideos extends StatelessWidget {
  const BodyVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 4),
      children: List.generate(
        100,
        (index) => CardItems(
          imageUrl:
              "https://www.rhbinformatica.com.br/arquivos/2017/09/logo-logica-de-programacao-322x322.png",
          title: "Pilares de programação",
          subtitle: "Orientação objeto, Lógica de programação e etc.",
          onTap: () => Get.to(
            () => CoursesListPage(),
          ),
        ),
      ),
    );
  }
}
