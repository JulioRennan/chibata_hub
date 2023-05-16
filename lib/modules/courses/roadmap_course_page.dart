import 'package:chibata_hub/core/shared_components/buttons/primary_button.dart';
import 'package:chibata_hub/core/shared_components/custom_checkbox.dart';
import 'package:chibata_hub/core/theme/app_colors.dart';
import 'package:chibata_hub/modules/courses/widgets/dialog_about_class.dart';
import 'package:chibata_hub/modules/home/widgets/circle_roadmap.dart';
import 'package:chibata_hub/modules/video/video_page.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:get/get.dart';

class RoadmapCoursePage extends StatefulWidget {
  const RoadmapCoursePage({super.key});

  @override
  State<RoadmapCoursePage> createState() => _RoadmapCoursePageState();
}

class _RoadmapCoursePageState extends State<RoadmapCoursePage> {
  bool isLeftFromRight = true;
  List<Offset> pointsWidgets = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pointsWidgets.clear();
    List.generate(
      5,
      (index) {
        final left = calcPosition(context, index);
        final top = index * 100;
        pointsWidgets.add(Offset(left + 40, top.toDouble() + 40));
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trilha POO com Java'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 6 * 100,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Stack(
            children: [
              Positioned(
                child: CustomPaint(
                  size: Size(
                    MediaQuery.of(context).size.width,
                    6 * 100,
                  ),
                  painter: LinesPainter(pointsWidgets),
                ),
              ),
              ...List.generate(
                5,
                (index) {
                  if (index % 3 == 0) {
                    isLeftFromRight = !isLeftFromRight;
                  }
                  final left = calcPosition(context, index);
                  final top = index * 100;
                  return Positioned(
                    left: left,
                    top: top.toDouble(),
                    child: CircleRoadmap(
                      index: index,
                      isViewed: false,
                      isVideo: false,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => const DialogAboutClass(),
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  calcPosition(BuildContext context, int index) {
    final positions = <int>[0, 1, 2, 1];
    final tam = positions.length;
    final screenWidth = MediaQuery.of(context).size.width;
    return (screenWidth / 3) * (positions[index % tam] + 1) - 100;
  }
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
