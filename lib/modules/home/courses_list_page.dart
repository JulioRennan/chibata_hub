import 'package:chibata_hub/modules/courses/roadmap_course_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';
import 'home_controller.dart';
import 'widgets/card_items.dart';

class CoursesListPage extends StatelessWidget {
  const CoursesListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Cursos',
          style: StyleThemes.title.withColor(Colors.white),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          children: [
            for (var course in controller.listCourses)
              CardItems(
                imageUrl: course['imageUrl'],
                title: course['title'],
                subtitle: course['subtitle'],
                onTap: () {
                  controller.loadClasses(course['id']);
                  Get.to(
                    () => RoadmapCoursePage(),
                  );
                },
              ),
          ],
        );
      }),
    );
  }
}
