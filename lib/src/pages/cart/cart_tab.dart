import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/custom_colors.dart';
// ignore: library_prefixes
import 'package:flutter_application_1/src/config/app_data.dart' as appData;
import 'package:flutter_application_1/src/model/cart_item_model.dart';
import 'package:flutter_application_1/src/pages/cart/components/cart_title.dart';
import 'package:flutter_application_1/src/services/utils.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final Utils utils = Utils();

  void removeCartItem(CartItemModel item) {
    setState(() {
      appData.cartItems.remove(item);
    });
  }

  double totalCartPrice() {
    double total = 0;
    for (var cartItem in appData.cartItems) {
      total += cartItem.item.price * cartItem.quantity;
    }

    return total;
  }

  void hasChanged(bool hasChanged) {
    setState(() {
      totalCartPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColors.customizedAppColor,
        title: const Text(
          "Carrinho",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: appData.cartItems.length,
              itemBuilder: (context, index) {
                return CartTitle(
                  cartItem: appData.cartItems[index],
                  removeItem: removeCartItem,
                  changedItem: hasChanged,
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Total geral",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  utils.priceToCurrency(totalCartPrice()),
                  style: TextStyle(
                      fontSize: 24,
                      color: CustomColors.customizedAppColor,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool? result = await confirmOrder();
                    },
                    child: const Text(
                      "Concluir Pedido",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> confirmOrder() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("Confirmação de Pedido"),
          content: const Text("Deseja finalizar esse pedido?"),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("Não"),
            ),
            const SizedBox(
              width: 90,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text("Sim"),
            ),
          ],
        );
      },
    );
  }
}
