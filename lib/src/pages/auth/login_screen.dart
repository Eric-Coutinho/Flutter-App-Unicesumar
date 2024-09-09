import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/auth/components/text_form.dart';
import 'package:flutter_application_1/src/pages/base/base_screen.dart';
import 'package:flutter_application_1/src/config/custom_colors.dart';
import 'package:flutter_application_1/src/pages/register/register_screen.dart';

void main() {
  runApp(const LoginScreen());
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customizedAppColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          child: Column(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(TextSpan(
                    style: const TextStyle(fontSize: 35),
                    children: [
                      const TextSpan(
                          text: 'Hortifruti ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'Comunitária',
                          style: TextStyle(
                              color: CustomColors.customizedContrastColor)),
                    ],
                  )),
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
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(45))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const TextForm(label: "Email", icon: Icons.email),
                          const TextForm(
                              label: "Senha", icon: Icons.lock, isSecret: true),
                          SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (c) {
                                      return BaseScreen();
                                    }));
                                  },
                                  child: const Text(
                                    'Entrar',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ))),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {},
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
                                        borderRadius: BorderRadius.circular(18),
                                        side: const BorderSide(
                                          width: 3,
                                        )),
                                    side: BorderSide(
                                        color: CustomColors.customizedAppColor,
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
    );
  }
}
