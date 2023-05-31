import 'package:chibata_hub/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CircleRoadmap extends StatelessWidget {
  const CircleRoadmap({
    super.key,
    required this.index,
    required this.isViewed,
    required this.onPressed,
    required this.isVideo,
  });

  final int index;
  final bool isViewed;
  final void Function() onPressed;
  final bool isVideo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isViewed ? AppColors.primaryColor : const Color(0xffD9D9D9),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey.shade400,
          )
        ],
      ),
      child: InkWell(
        onTap: onPressed,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: Image.asset(
                isVideo
                    ? "assets/images/icon_video.png"
                    : "assets/images/icon_article.png",
                width: 40,
              ),
            ),
            Positioned(
              right: -15,
              top: -5,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0xff424040),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '$index',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
