import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/custom_colors.dart';
import 'package:flutter_application_1/src/pages/widgets/text_form.dart';
import 'package:flutter_application_1/src/config/app_data.dart' as app_data;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Perfil do Usuário',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: CustomColors.customizedAppColor,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          children: [
            // Email
            TextForm(
              icon: Icons.email,
              label: 'Email',
              initialValue: app_data.user.email,
            ),
            // Nome
            TextForm(
              icon: Icons.person,
              label: 'Nome',
              initialValue: app_data.user.name,
              isReadOnly: true,
            ),
            // Celular
            TextForm(
              icon: Icons.phone,
              label: 'Celular',
              initialValue: app_data.user.phone,
            ),
            // CPF
            TextForm(
              icon: Icons.file_copy,
              label: 'CPF',
              initialValue: app_data.user.cpf,
              isSecret: true,
              isReadOnly: true,
            ),
            // Botao atualizar
            SizedBox(
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: CustomColors.customizedAppColor,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  updatePassword();
                },
                child: const Text('Atualizar senha'),
              ),
            )
          ],
        ));
  }

  Future<bool?> updatePassword() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Atualizar Senha',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),

                      // Senha atual
                      const TextForm(
                        icon: Icons.lock,
                        label: 'Senha Atual',
                        isSecret: true,
                      ),

                      // Nova senha
                      const TextForm(
                        icon: Icons.lock_outline,
                        label: 'Nova Senha',
                        isSecret: true,
                      ),

                      // Confirmar nova senha
                      const TextForm(
                        icon: Icons.lock_outline,
                        label: 'Confirmar Nova Senha',
                        isSecret: true,
                      ),

                      // Botao Confimar
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Atualizar',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 5,
                  top: 5,
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
        });
  }
}
