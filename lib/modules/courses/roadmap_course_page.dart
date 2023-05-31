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
        title: const Text('Trilha POO com Java'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
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
                        isViewed: false,
                        isVideo: currentRoadmap['isVideo'],
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => DialogAboutClass(
                              title: 'Aula $index',
                              message: currentRoadmap['description'],
                              isVideo: currentRoadmap['isVideo'],
                              link: currentRoadmap['link'],
                              annotations: currentRoadmap['annotations'] ?? '',
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
      }),
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
      ..color = Colors.black
      ..strokeWidth = 4
      ..shader = LinearGradient(
        colors: const [Colors.black54, Colors.transparent],
        stops: const [0.5, 0.5],
        tileMode: TileMode.repeated,
        transform: GradientRotation(isLeft ? degress45 : -degress45),
      ).createShader(const Rect.fromLTWH(0, 0, 10, 10))
      ..style = PaintingStyle.stroke;
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
