import 'package:chibata_hub/core/shared_components/snackbars/snackbar_error.dart';
import 'package:chibata_hub/modules/home/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignController extends GetxController {
  bool isLoading = false;

  Future<void> sign(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAll(() => const HomePage());
    } catch (e) {
      showErrorSnackbar('Credenciais inválidas, verifique e tente novamente!');
    }
  }

  Future<void> signWithGoogle() async {
    try {
      final result = await FirebaseAuth.instance.signInWithProvider(
        GoogleAuthProvider(),
      );

      final countEmails = await FirebaseFirestore.instance
          .collection("users")
          .where(
            "email",
            isEqualTo: result.user!.email,
          )
          .count()
          .get();
      if (countEmails.count == 0) {
        await _createUser(result.user!.email!, result.user!.uid);
      }
      Get.offAll(() => const HomePage());
    } catch (e) {
      showErrorSnackbar();
    }
  }

  Future<void> _createUser(
    String email,
    String userId,
  ) async {
    return FirebaseFirestore.instance.collection("users").doc(userId).set(
      {'email': email},
    );
  }
}
