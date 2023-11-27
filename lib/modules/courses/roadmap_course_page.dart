import 'package:chibata_hub/core/theme/app_colors.dart';
import 'package:chibata_hub/modules/courses/widgets/dialog_about_class.dart';
import 'package:chibata_hub/modules/home/home_controller.dart';
import 'package:chibata_hub/modules/home/widgets/circle_roadmap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoadmapCoursePage extends StatefulWidget {
  const RoadmapCoursePage({super.key});

  @override
  State<RoadmapCoursePage> createState() => _RoadmapCoursePageState();
}

class _RoadmapCoursePageState extends State<RoadmapCoursePage> {
  bool isLeftFromRight = true;
  List<Offset> pointsWidgets = [];
  final controller = Get.find<HomeController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.listAreas.firstWhere(
            (element) => element['id'] == controller.currentIdArea,
          )['title'],
        ),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (controller.listClasses.isEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search_off_rounded,
                  size: 150,
                  color: AppColors.primaryColor,
                ),
                Text(
                  'Não há aulas para esta área ainda...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            );
          }
          pointsWidgets.clear();
          List.generate(
            tamItens,
            (index) {
              final left = calcPosition(context, index);
              final top = index * 100;
              pointsWidgets.add(Offset(left + 40, top.toDouble() + 40));
            },
          );
          return GetBuilder<HomeController>(
            builder: (_) {
              return SingleChildScrollView(
                child: Container(
                  height: (tamItens + 1) * 100,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Stack(
                    children: [
                      Positioned(
                        child: CustomPaint(
                          size: Size(
                            MediaQuery.of(context).size.width,
                            (tamItens + 1) * 100,
                          ),
                          painter: LinesPainter(pointsWidgets),
                        ),
                      ),
                      ...List.generate(
                        tamItens,
                        (index) {
                          if (index % 3 == 0) {
                            isLeftFromRight = !isLeftFromRight;
                          }
                          final left = calcPosition(context, index);
                          final top = index * 100;
                          final currentRoadmap = controller.listClasses[index];
                          return Positioned(
                            left: left,
                            top: top.toDouble(),
                            child: CircleRoadmap(
                              index: index + 1,
                              isViewed: Get.find<HomeController>()
                                  .listVideoViewers
                                  .contains(
                                    currentRoadmap['id'],
                                  ),
                              isVideo: currentRoadmap['isVideo'],
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => DialogAboutClass(
                                    title: 'Aula $index',
                                    uid: currentRoadmap['id'],
                                    message: currentRoadmap['description'],
                                    isVideo: currentRoadmap['isVideo'],
                                    link: currentRoadmap['link'],
                                    annotations:
                                        currentRoadmap['annotations'] ?? '',
                                    index: index,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  calcPosition(BuildContext context, int index) {
    final positions = <int>[0, 1, 2, 1];
    final tam = positions.length;
    final screenWidth = MediaQuery.of(context).size.width;
    return (screenWidth / 3) * (positions[index % tam] + 1) - 100;
  }

  int get tamItens => controller.listClasses.length;
}

class LinesPainter extends CustomPainter {
  LinesPainter(
    this.pointsWidgets,
  );
  final List<Offset> pointsWidgets;
  //         <-- CustomPainter class
  @override
  void paint(Canvas canvas, Size size) {
    final paintLeftToRight = stokePaint(true);

    final paintRightToLeft = stokePaint(false);

    bool isLeftToRight = true;
    for (int i = 1; i < pointsWidgets.length; i++) {
      if (i % 3 == 0) {
        isLeftToRight = !isLeftToRight;
      }
      final currentPoint = pointsWidgets[i];
      final beforedPoint = pointsWidgets[i - 1];
      canvas.drawLine(
        beforedPoint,
        currentPoint,
        isLeftToRight ? paintLeftToRight : paintRightToLeft,
      );
    }
  }

  Paint stokePaint(bool isLeft) {
    const degress45 = 3.14 / 4;
    return Paint()
      ..color = Colors.black.withOpacity(.2)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
