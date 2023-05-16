import 'package:chibata_hub/modules/afd/afd_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'widgets/card_items.dart';

class BodyInteractions extends StatelessWidget {
  const BodyInteractions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 4),
      children: [
        CardItems(
          imageUrl: "assets/images/automato_image.png",
          title: "Automatos finitos deterministicos (AFD)",
          subtitle: "Crie  e teste seus AFDS em tempo real",
          onTap: () => Get.to(() => const AFDPage()),
        ),
      ],
    );
  }
}
