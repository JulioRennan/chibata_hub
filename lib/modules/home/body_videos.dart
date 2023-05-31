import 'package:chibata_hub/modules/home/courses_list_page.dart';
import 'package:chibata_hub/modules/home/home_controller.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 4),
        children: Get.find<HomeController>()
            .listAreas
            .map(
              (e) => CardItems(
                  imageUrl: e['imageUrl'],
                  title: e['title'],
                  subtitle: e['subtitle'],
                  onTap: () {
                    Get.find<HomeController>().loadCourses(e['id']);
                    Get.to(
                      () => CoursesListPage(),
                    );
                  }),
            )
            .toList());
  }
}
