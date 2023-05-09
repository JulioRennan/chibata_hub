import 'package:chibata_hub/core/shared_components/buttons/primary_button.dart';
import 'package:chibata_hub/core/theme/app_colors.dart';
import 'package:chibata_hub/core/validators.dart';
import 'package:chibata_hub/modules/create_account/create_account_page.dart';
import 'package:chibata_hub/modules/sign/sign_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignPage extends StatelessWidget {
  SignPage({
    super.key,
  });

  final controller = Get.put(SignController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0, -.4),
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Color.fromRGBO(0, 197, 182, 1),
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                onPressed: () => Get.to(() => CreateAccountPage()),
                child: Text(
                  "Nova conta",
                  style: StyleThemes.button.withColor(
                    AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Form(
          key: keyForm,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                ),
                Center(
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 50,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Login',
                            style: StyleThemes.title.withColor(
                              AppColors.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: emailController,
                            decoration:
                                const InputDecoration(labelText: "Email"),
                            validator: validateEmail,
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: passwordController,
                            decoration:
                                const InputDecoration(labelText: "Senha"),
                            validator: validatorPassword,
                          ),
                          const SizedBox(height: 20),
                          PrimaryButton(
                            child: const Text("Entrar"),
                            onPressed: () async {
                              if (keyForm.currentState!.validate()) {
                                await controller.sign(
                                  emailController.text,
                                  passwordController.text,
                                );
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Container(
                              height: 5,
                              width: 5,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                    Colors.black87,
                                  ),
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        5,
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: () => controller.signWithGoogle(),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/logo_google.png",
                                      width: 25,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Entrar com Google",
                                      style: StyleThemes.button,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
