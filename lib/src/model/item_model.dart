import 'package:flutter_application_1/src/model/category_model.dart';

class ItemModel {
  String itemName;
  String urlImage;
  String typeUnity;
  double price;
  String itemDescription;
  CategoryModel category;

  ItemModel({
    required this.itemName,
    required this.urlImage,
    required this.typeUnity,
    required this.price,
    required this.itemDescription,
    required this.category,
  });
}
