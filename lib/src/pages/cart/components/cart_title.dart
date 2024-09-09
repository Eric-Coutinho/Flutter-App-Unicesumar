import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/custom_colors.dart';
import 'package:flutter_application_1/src/model/cart_item_model.dart';
import 'package:flutter_application_1/src/pages/widgets/quantity_widget.dart';
import 'package:flutter_application_1/src/services/utils.dart';

class CartTitle extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(CartItemModel item) removeItem;
  final Function(bool hasChanged) changedItem;

  const CartTitle(
      {super.key,
      required this.cartItem,
      required this.removeItem,
      required this.changedItem});

  @override
  State<CartTitle> createState() => _CartTitleState();
}

class _CartTitleState extends State<CartTitle> {
  final Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Image.asset(
          widget.cartItem.item.urlImage,
          height: 55,
          width: 55,
        ),
        title: Text(
          widget.cartItem.item.itemName,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          utils.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(
            color: CustomColors.customizedAppColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: SizedBox(
          width: 107,
          child: QuantityWidget(
            value: widget.cartItem.quantity,
            unity: widget.cartItem.item.typeUnity,
            isRemovable: true,
            result: (amount) {
              setState(() {
                widget.cartItem.quantity = amount;
                widget.changedItem(true);
                if (amount == 0) {
                  widget.removeItem(widget.cartItem);
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
