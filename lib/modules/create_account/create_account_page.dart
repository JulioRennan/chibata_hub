import 'package:chibata_hub/core/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/shared_components/buttons/primary_button.dart';
import '../../core/theme/app_colors.dart';
import 'create_account_controller.dart';

class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({
    super.key,
  });

  final controller = Get.put(CreateAccountController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
          leading: IconButton(
            color: AppColors.primaryColor,
            iconSize: 30,
            icon: const Icon(Icons.chevron_left),
            onPressed: () => Get.back(),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
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
                            'Nova conta',
                            style: StyleThemes.title.withColor(
                              AppColors.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              labelText: "Email",
                            ),
                            validator: validateEmail,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: const InputDecoration(
                              labelText: "Senha",
                            ),
                            validator: (value) => validatorPassword(
                              value,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: confirmPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: const InputDecoration(
                              labelText: "Confirmação de senha",
                            ),
                            validator: (value) => validatorConfirmPassword(
                              value,
                              passwordController.text,
                            ),
                          ),
                          const SizedBox(height: 20),
                          PrimaryButton(
                            child: const Text("Cadastrar-se"),
                            onPressed: () async {
                              if (keyForm.currentState!.validate()) {
                                await controller.createAccount(
                                  emailController.text,
                                  passwordController.text,
                                );
                              }
                            },
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
