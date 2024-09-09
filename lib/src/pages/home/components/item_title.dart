import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/custom_colors.dart';
import 'package:flutter_application_1/src/model/item_model.dart';
import 'package:flutter_application_1/src/pages/product/product_screen.dart';
import 'package:flutter_application_1/src/services/utils.dart';

class ItemTitle extends StatelessWidget {
  ItemTitle({super.key, required this.item});

  final ItemModel item;
  final Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c) {
              return ProductScreen(item: item);
            }));
          },
          child: Card(
              elevation: 1,
              shadowColor: Colors.grey.shade300,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Hero(
                        tag: item.urlImage,
                        child: Image.asset(item.urlImage),
                      ),
                    ),
                    Text(
                      item.itemName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          utils.priceToCurrency(item.price),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: CustomColors.customizedAppColor),
                        ),
                        Text(
                          '/${item.typeUnity}',
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {
              print('Item Selecionado: ${item.itemName}');
            },
            child: Container(
              height: 40,
              width: 36,
              decoration: BoxDecoration(
                  color: CustomColors.customizedAppColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topRight: Radius.circular(20),
                  )),
              child: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
