// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/custom_colors.dart';

class OrderStatus extends StatelessWidget {
  final String status;
  final bool pixExpirado;

  OrderStatus({super.key, required this.status, required this.pixExpirado});

  final Map<String, int> allStatus = <String, int>{
    'pagamento_pendente': 0,
    'estornado': 1,
    'pagamento': 2,
    'preparando': 3,
    'enviando': 4,
    'entregue': 5,
  };

  int get currentStatus => allStatus[status]!;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _OrderStatus(
          title: 'Pedido Confirmado',
          isActive: true,
        ),
        const _CustomDivisor(),
        if (currentStatus == 1) ...[
          const _OrderStatus(
            title: 'Pix Estornado',
            isActive: true,
            background: Colors.amber,
          )
        ] else if (pixExpirado) ...[
          const _OrderStatus(
            title: 'Pix Expirado',
            isActive: true,
            background: Colors.red,
          )
        ] else ...[
          _OrderStatus(title: 'Pagamento', isActive: currentStatus >= 2),
          const _CustomDivisor(),
          _OrderStatus(title: 'Preparando', isActive: currentStatus >= 3),
          const _CustomDivisor(),
          _OrderStatus(title: 'Enviado', isActive: currentStatus >= 4),
          const _CustomDivisor(),
          _OrderStatus(title: 'Entregue', isActive: currentStatus == 5),
        ]
      ],
    );
  }
}

class _CustomDivisor extends StatelessWidget {
  const _CustomDivisor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      height: 10,
      width: 1,
      color: Colors.grey.shade500,
    );
  }
}

// ignore: camel_case_types
class _OrderStatus extends StatelessWidget {
  final String title;
  final bool isActive;
  final Color? background;

  const _OrderStatus(
      {super.key,
      required this.title,
      required this.isActive,
      this.background});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Imagem
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: CustomColors.customizedAppColor),
              color: isActive
                  ? background ?? CustomColors.customizedAppColor
                  : Colors.transparent),
          child: isActive
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 15,
                )
              : const SizedBox.shrink(),
        ),
        const SizedBox(width: 5),
        // Status
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 12),
          ),
        )
      ],
    );
  }
}
