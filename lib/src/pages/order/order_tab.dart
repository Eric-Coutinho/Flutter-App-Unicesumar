import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/custom_colors.dart';
import 'package:flutter_application_1/src/config/app_data.dart' as app_data;
import 'package:flutter_application_1/src/pages/order/components/order_title.dart';

class OrderTab extends StatelessWidget {
  const OrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pedidos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: CustomColors.customizedAppColor,
      ),
      body: ListView.separated(
        itemBuilder: (_, index) => OrderTitle(order: app_data.orders[index]),
        separatorBuilder: (_, index) => const SizedBox(height: 12,),
        itemCount: app_data.orders.length,
      ),
    );
  }
}
