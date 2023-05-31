import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<dynamic> listAreas = [];
  List<dynamic> listCourses = [];
  List<dynamic> listClasses = [];
  RxBool isLoading = false.obs;
  String currentIdArea = '';
  Future<void> loadAreas() async {
    isLoading.value = true;
    currentIdArea = '';
    listAreas = (await FirebaseFirestore.instance.collection("areas").get())
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
