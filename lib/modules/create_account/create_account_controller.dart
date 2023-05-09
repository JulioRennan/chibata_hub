import 'package:chibata_hub/core/shared_components/snackbars/snackbar_error.dart';
import 'package:chibata_hub/modules/home/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  Future<void> createAccount(
    String email,
    String password,
  ) async {
    try {
      final firebaseUser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _createUser(email, firebaseUser.user!.uid);

      Get.offAll(() => const HomePage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showErrorSnackbar('Esse email ja foi utilizado');
      }
    } catch (e) {
      showErrorSnackbar();
    }
  }


  Future<void> _createUser(
    String email,
    String userId,
  ) async {
    await FirebaseFirestore.instance.collection("users").doc(userId).set(
      {'email': email},
    );
  }
}
