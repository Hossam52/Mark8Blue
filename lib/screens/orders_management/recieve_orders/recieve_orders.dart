import 'package:clean_app/screens/orders_management/recieve_orders/delivery_page.dart';
import 'package:clean_app/screens/orders_management/recieve_orders/monaola_page.dart';
import 'package:clean_app/widgets/custom_toggle_buttons.dart';
import 'package:flutter/material.dart';

class RecieveOrders extends StatefulWidget {
  RecieveOrders({Key? key}) : super(key: key);

  @override
  State<RecieveOrders> createState() => _RecieveOrdersState();
}

class _RecieveOrdersState extends State<RecieveOrders> {
  @override
  void initState() {
    recieveOrdersTypeTaps = [
      ToggleItemDataWithWidget(
          title: 'Delivery',
          onPressed: () => onChangeDeliveryType(0),
          page: DeliveryPage()),
      ToggleItemDataWithWidget(
          title: 'Monaola',
          onPressed: () => onChangeDeliveryType(1),
          page: MonaloaPage()),
    ];
    super.initState();
  }

  late List<ToggleItemDataWithWidget> recieveOrdersTypeTaps;
  int selectedDeliveryTypeIndex = 0;
  void onChangeDeliveryType(int index) {
    setState(() {
      selectedDeliveryTypeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _recieveOrderType(),
          SizedBox(height: 8),
          recieveOrdersTypeTaps[selectedDeliveryTypeIndex].page,
        ],
      ),
    );
  }

  Widget _recieveOrderType() {
    return CustomToggleButtons(
      tabs: recieveOrdersTypeTaps,
      selectedIndex: selectedDeliveryTypeIndex,
    );
  }
}
