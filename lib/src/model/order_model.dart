import 'package:flutter_application_1/src/model/cart_item_model.dart';

class OrderModel {
  String code;
  DateTime dateTimeOrder;
  DateTime dateTimePixFinished;
  List<CartItemModel> items;
  String status;
  String copyPaste;
  double value;

  OrderModel({
    required this.code,
    required this.dateTimeOrder,
    required this.dateTimePixFinished,
    required this.items,
    required this.status,
    required this.copyPaste,
    required this.value,
  });
}
