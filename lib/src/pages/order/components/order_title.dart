import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/model/cart_item_model.dart';
import 'package:flutter_application_1/src/model/order_model.dart';
import 'package:flutter_application_1/src/pages/order/components/order_status.dart';
import 'package:flutter_application_1/src/pages/widgets/payment_dialog.dart';
import 'package:flutter_application_1/src/services/utils.dart';

class OrderTitle extends StatelessWidget {
  final OrderModel order;
  final Utils utils = Utils();

  OrderTitle({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: order.status == 'pagamento_pendente',
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pedido: ${order.code}',
          ),
          Text(
            utils.formataDataHora(order.dateTimeOrder),
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
      childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              // Lista de Produtos
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 150,
                  child: ListView(
                    children: order.items.map((itemOrder) {
                      return itemOrderWidget(
                        itemOrder: itemOrder,
                        utils: utils,
                      );
                    }).toList(),
                  ),
                ),
              ),

              // Divisor
              VerticalDivider(
                color: Colors.grey.shade400,
                thickness: 2,
                width: 10,
              ),

              // Status do Pedido
              Expanded(
                  flex: 2,
                  child: OrderStatus(
                    status: order.status,
                    pixExpirado: order.dateTimePixFinished.isBefore(
                      DateTime.now(),
                    ),
                  )),
            ],
          ),
        ),
        // Total Geral
        Text.rich(
          TextSpan(
            style: const TextStyle(fontSize: 20),
            children: [
              const TextSpan(
                  text: 'Total ',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: utils.priceToCurrency(order.value)),
            ],
          ),
        ),
        // Botao de pagamento
        Visibility(
          visible: order.status == 'pagamento_pendente',
          child: SizedBox(
            height: 45,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                showDialog(context: context, builder: (_) {
                  return PaymentDialog(order: order);
                });
              },
              label: const Text("Ver QR Code Pix"),
              icon: const Icon(Icons.pix),
            ),
          ),
        )
      ],
    );
  }
}

// ignore: camel_case_types
class itemOrderWidget extends StatelessWidget {
  final CartItemModel itemOrder;
  final Utils utils;

  const itemOrderWidget(
      {super.key, required this.itemOrder, required this.utils});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${itemOrder.quantity} ${itemOrder.item.typeUnity} - ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(itemOrder.item.itemName),
          ),
          Text(utils.priceToCurrency(itemOrder.item.price)),
        ],
      ),
    );
  }
}
