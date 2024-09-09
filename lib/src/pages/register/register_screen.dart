import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/auth/components/text_form.dart';
import 'package:flutter_application_1/src/config/custom_colors.dart';
import 'package:flutter_application_1/src/pages/auth/login_screen.dart';

void main() {
  runApp(const RegisterScreen());
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              const Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(TextSpan(
                    style: TextStyle(fontSize: 35),
                    children: [
                      TextSpan(
                          text: 'Cadastro',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold))
                    ],
                  ))
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
                              const TextForm(label: "Nome", icon: Icons.person),
                              const TextForm(label: "Celular", icon: Icons.phone),
                              const TextForm(label: "CPF", icon: Icons.edit_document),
                          SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          CustomColors.customizedAppColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18))),
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (c) {
                                      return const LoginScreen();
                                    }));
                                  },
                                  child: const Text(
                                    'Cadastrar Usuário',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ))),
                        ],
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
