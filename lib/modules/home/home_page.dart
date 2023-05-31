import 'package:chibata_hub/core/theme/app_colors.dart';
import 'package:chibata_hub/modules/home/body_interactions.dart';
import 'package:chibata_hub/modules/home/body_videos.dart';
import 'package:chibata_hub/modules/home/home_controller.dart';
import 'package:chibata_hub/modules/home/widgets/card_items.dart';
import 'package:chibata_hub/modules/sign/sign_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final controller = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    controller.loadAreas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          index == 0 ? 'Áreas do curso' : 'Módulos interativos',
          style: StyleThemes.title.withColor(Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then(
                    (_) => Get.offAll(() => SignPage()),
                  );
            },
            icon: const Icon(Icons.exit_to_app_rounded),
          )
        ],
      ),
      body: index == 0
          ? Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return BodyVideos();
            })
          : BodyInteractions(),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == 0 ? AppColors.primaryColor : Colors.white,
              ),
              child: GestureDetector(
                onTap: () => setState(() {
                  if (index == 0) return;
                  index = 0;
                }),
                child: Icon(
                  Icons.play_arrow,
                  size: 30,
                  color: index == 0 ? Colors.white : AppColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(width: 30),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == 1 ? AppColors.primaryColor : Colors.white,
              ),
              child: GestureDetector(
                onTap: () => setState(() {
                  if (index == 1) return;
                  index = 1;
                }),
                child: Image.asset(
                  "assets/images/icons_musc.png",
                  width: 40,
                  color: index == 1 ? Colors.white : AppColors.primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
