import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/custom_colors.dart';
import 'package:flutter_application_1/src/model/order_model.dart';
import 'package:flutter_application_1/src/services/utils.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentDialog extends StatelessWidget {
  final OrderModel order;

  PaymentDialog({super.key, required this.order});

  final Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Titulo
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Pagamento com Pix',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),

                // QR Code
                QrImageView(
                  data: "aaaaaa",
                  version: QrVersions.auto,
                  size: 200,
                ),

                // Vencimento
                Text(
                  'Vencimento: ${utils.formataDataHora(order.dateTimeOrder)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                // Total
                Text(
                  'Total: ${utils.priceToCurrency(order.value)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                // Copia e Cola
                OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: BorderSide(
                        width: 2,
                        color: CustomColors.customizedAppColor,
                      )),
                  label: Text(
                    'Copiar código Pix',
                    style: TextStyle(
                        fontSize: 12, color: CustomColors.customizedAppColor),
                  ),
                  icon: Icon(
                    Icons.copy,
                    color: CustomColors.customizedAppColor,
                    size: 16,
                  ),
                )
              ],
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
          ),
        ],
      ),
    );
  }
}
