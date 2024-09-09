import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/custom_colors.dart';
import 'package:flutter_application_1/src/model/item_model.dart';
import 'package:flutter_application_1/src/pages/widgets/quantity_widget.dart';
import 'package:flutter_application_1/src/services/utils.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.item});

  final ItemModel item;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final Utils utils = Utils();

  int totalAmountCart = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withAlpha(200),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Hero(
                  tag: widget.item.urlImage,
                  child: Image.asset(widget.item.urlImage),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          offset: const Offset(0, 3),
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.item.itemName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                          ),
                          QuantityWidget(
                            value: totalAmountCart,
                            unity: widget.item.typeUnity,
                            result: (amount) {
                              setState(() {
                                totalAmountCart = amount;
                              });
                            },
                          )
                        ],
                      ),
                      Text(
                        utils.priceToCurrency(widget.item.price),
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.customizedAppColor),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.item.itemDescription,
                              style: const TextStyle(height: 1.5, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon:
                              const Icon(Icons.shopping_cart_checkout_outlined),
                          label: const Text(
                            "Adicionar no carrinho",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          )
        ],
      ),
    );
  }
}
