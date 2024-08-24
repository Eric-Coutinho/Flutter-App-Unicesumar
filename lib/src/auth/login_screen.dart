import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/auth/components/text_form.dart';

void main() {
  runApp(const LoginScreen());
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: Colors.blue,
          )),
          Expanded(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(45))),
                  child: Column(
                    children: [
                      TextForm(label: "Email", icon: Icons.email), 
                      TextForm(label: "Senha", icon: Icons.lock, hideText: true), 
                    ],
                  ))),
        ],
      ),
    );
  }
}
