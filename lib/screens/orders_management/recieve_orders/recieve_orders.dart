import 'package:clean_app/screens/orders_management/recieve_orders/delivery_page.dart';
import 'package:clean_app/screens/orders_management/recieve_orders/monaola_page.dart';
import 'package:common_widgets/delivery_monaola_page.dart';
import 'package:flutter/material.dart';

class RecieveOrders extends StatelessWidget {
  RecieveOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: DeliveryMonaolaPage(
      deliveryWidget: DeliveryPage(),
      monaolaWidget: MonaloaPage(),
      intialSelected: OrderRecievingType.Delivery,
    ));
  }
}
