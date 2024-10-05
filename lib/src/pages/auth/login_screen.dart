import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/auth/components/forgot_password_dialog.dart';
import 'package:flutter_application_1/src/pages/auth/controller/auth_controller.dart';
import 'package:flutter_application_1/src/pages/widgets/app_title.dart';
import 'package:flutter_application_1/src/pages/widgets/text_form.dart';
import 'package:flutter_application_1/src/config/custom_colors.dart';
import 'package:flutter_application_1/src/pages/register/register_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customizedAppColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppTitle(
                      titleColor: Colors.white,
                      fontSize: 35,
                    ),
                    SizedBox(
                      height: 38,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          pause: const Duration(milliseconds: 500),
                          animatedTexts: [
                            FadeAnimatedText(
                              'Frutas',
                            ),
                            FadeAnimatedText(
                              'Verduras',
                            ),
                            FadeAnimatedText(
                              'Legumes',
                            ),
                            FadeAnimatedText(
                              'Carnes',
                            ),
                            FadeAnimatedText(
                              'Cereais',
                            ),
                            FadeAnimatedText(
                              'Laticínios',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 40),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(45))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextForm(
                              label: "Email",
                              icon: Icons.email,
                              controller: emailController,
                              validate: (email) {
                                if (email == null || email.isEmpty) {
                                  return 'Digite seu email.';
                                }
                                if (!email.isEmail) {
                                  return 'Informe um Email válido.';
                                }
                                return null;
                              },
                            ),
                            TextForm(
                              label: "Senha",
                              icon: Icons.lock,
                              isSecret: true,
                              controller: passwordController,
                              validate: (password) {
                                if (password == null || password.isEmpty) {
                                  return 'Digite sua senha.';
                                }

                                if (password.length < 8) {
                                  return 'A senha deve ter pelo menos 8 caracteres.';
                                }
                                return null;
                              },
                            ),
                            GetX<AuthController>(
                              builder: (authController) {
                                return SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: authController.isLoading.value
                                        ? null
                                        : () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              FocusScope.of(context).unfocus();
                                              String email =
                                                  emailController.text;
                                              String password =
                                                  passwordController.text;

                                              authController.login(
                                                  email: email,
                                                  password: password);

                                              // Get.toNamed(
                                              //     PageRoutes.homeRoute);
                                            }
                                          },
                                    child: authController.isLoading.value
                                        ? const CircularProgressIndicator(
                                            color: Colors.red,
                                          )
                                        : const Text(
                                            'Entrar',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {
                                      showDialog(context: context, builder: (_) {
                                        return ForgotPasswordDialog(email: emailController.text,);
                                      });
                                    },
                                    child: Text(
                                      'Esqueci minha senha',
                                      style: TextStyle(
                                          color: CustomColors
                                              .customizedContrastColor,
                                          fontSize: 16),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 42),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Divider(
                                    color: CustomColors.inputTextColor,
                                    thickness: 2,
                                  )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18),
                                    child: Text(
                                      'Ou',
                                      style: TextStyle(
                                          color: CustomColors.inputTextColor),
                                    ),
                                  ),
                                  Expanded(
                                      child: Divider(
                                    color: CustomColors.inputTextColor,
                                    thickness: 2,
                                  )),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          side: const BorderSide(
                                            width: 3,
                                          )),
                                      side: BorderSide(
                                          color:
                                              CustomColors.customizedAppColor,
                                          width: 2)),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (c) {
                                        return const RegisterScreen();
                                      }),
                                    );
                                  },
                                  child: Text(
                                    'Criar Conta',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: CustomColors.customizedAppColor),
                                  )),
                            ),
                          ],
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
