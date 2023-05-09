import 'package:chibata_hub/modules/courses/roadmap_course_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';
import 'widgets/card_items.dart';

class CoursesListPage extends StatelessWidget {
  const CoursesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Cursos',
          style: StyleThemes.title.withColor(Colors.white),
        ),
      ),
      body: ListView(
        children: [
          CardItems(
            imageUrl:
                "https://static.vecteezy.com/system/resources/previews/022/100/686/original/java-logo-transparent-free-png.png",
            title: "POO com Java",
            subtitle: "Princípios de orientação utilizando JAVA.",
            onTap: () => Get.to(
              () => RoadmapCoursePage(),
            ),
          ),
        ],
      ),
    );
  }
}
