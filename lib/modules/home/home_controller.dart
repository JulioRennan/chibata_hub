import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<String> listVideoViewers = [];

  List<dynamic> listAreas = [];
  List<dynamic> listCourses = [];
  List<dynamic> listClasses = [];
  RxBool isLoading = false.obs;
  String currentIdArea = '';
  Future<void> loadAreas() async {
    initVideoListener();
    isLoading.value = true;
    currentIdArea = '';
    listAreas = (await FirebaseFirestore.instance
            .collection("areas")
            .orderBy('index')
            .get())
        .docs
        .map(
          (e) => {
            'id': e.id,
            ...e.data(),
          },
        )
        .toList();
    isLoading.value = false;
  }

  initVideoListener() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen(
      (event) {
        if (event.data()?['listVideoViewers'] != null) {
          listVideoViewers = List<String>.from(
            event.data()?['listVideoViewers'],
          );
        } else {
          listVideoViewers = [];
        }
        update();
      },
    );
  }

  Future<void> removeViewer(String uidVideo) async {
    if (listVideoViewers.contains(uidVideo)) {
      listVideoViewers.removeWhere(
        (element) => element == uidVideo,
      );
      await updateListVideos();
    }
  }

  Future<void> addViewer(String uidVideo) async {
    if (!listVideoViewers.contains(uidVideo)) {
      listVideoViewers.add(uidVideo);
      await updateListVideos();
    }
  }

  Future<void> updateListVideos() async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'listVideoViewers': listVideoViewers,
    });
  }

  Future<void> loadCourses(String idArea) async {
    isLoading.value = true;
    listCourses.clear();
    currentIdArea = idArea;
    listCourses = (await FirebaseFirestore.instance
            .collection("areas")
            .doc(idArea)
            .collection('cursos')
            .get())
        .docs
        .map(
          (e) => {
            'id': e.id,
            ...e.data(),
          },
        )
        .toList();
    isLoading.value = false;
  }

  Future<void> loadClasses(String idCourse) async {
    isLoading.value = true;
    listClasses.clear();
    listClasses = (await FirebaseFirestore.instance
            .collection("areas")
            .doc(currentIdArea)
            .collection('cursos')
            .doc(idCourse)
            .collection('trilha')
            .orderBy('index')
            .get())
        .docs
        .map(
          (e) => {
            'id': e.id,
            ...e.data(),
          },
        )
        .toList();
    isLoading.value = false;
  }
}
