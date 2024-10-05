import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/auth/controller/auth_controller.dart';
import 'package:flutter_application_1/src/pages/widgets/text_form.dart';
import 'package:get/get.dart';

class ForgotPasswordDialog extends StatelessWidget {
  ForgotPasswordDialog({super.key, required String email});

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Recuperar Senha.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Text(
                    'Digite o email para recuperar a senha.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextForm(
                      label: 'Email',
                      icon: Icons.email,
                      controller: emailController,
                      validate: (email) {
                        if (email == null || email.isEmpty) {
                          return 'Digite seu email';
                        }
                        if (!email.isEmail) {
                          return 'Informe um Email válido.';
                        }
                        return null;
                      },
                    ),
                  ),
                  GetX<AuthController>(
                    builder: (authController) {
                      return SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: authController.isLoading.value
                              ? null
                              : () async {
                                  if (_formKey.currentState!.validate()) {
                                    await authController.recoverPassword(
                                        email: emailController.text);
                                  }
                                },
                          child: authController.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: Colors.red,
                                )
                              : const Text(
                                  'Recuperar',
                                  style: TextStyle(fontSize: 18),
                                ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          )
        ],
      ),
    );
  }
}
