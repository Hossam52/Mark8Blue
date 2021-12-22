import 'package:clean_app/screens/orders_management/add_order/add_order.dart';
import 'package:clean_app/screens/orders_management/prepare_orders/prepare_orders.dart';
import 'package:clean_app/screens/orders_management/recieve_orders/recieve_orders.dart';
import 'package:common_widgets/appbar_with_toggle_buttons.dart';

import 'package:common_widgets/custom_toggle_buttons.dart';
import 'package:flutter/material.dart';

class OrdersManagement extends StatefulWidget {
  OrdersManagement({Key? key}) : super(key: key);

  @override
  State<OrdersManagement> createState() => _OrdersManagementState();
}

class _OrdersManagementState extends State<OrdersManagement> {
  @override
  void initState() {
    ordersStates = [
      ToggleItemDataWithWidget(
          title: 'Add order',
          onPressed: () => onChangeIndex(0),
          page: AddOrders()),
      ToggleItemDataWithWidget(
          title: 'Prepare orders',
          onPressed: () => onChangeIndex(1),
          page: PrepareOrders()),
      ToggleItemDataWithWidget(
          title: 'Recieve orders',
          onPressed: () => onChangeIndex(2),
          page: RecieveOrders()),
    ];
    super.initState();
  }

  late List<ToggleItemDataWithWidget> ordersStates;

  int selectedIndex = 0;
  void onChangeIndex(int index) {
    controller.jumpToPage(index);
    setState(() {
      selectedIndex = index;
    });
  }

  final controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildToggleButtons(),
            Expanded(
              child: PageView(
                controller: controller,
                children: ordersStates.map((e) => e.page).toList(),
                onPageChanged: (index) {
                  setState(() {
                    onChangeIndex(index);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButtons() {
    final toggleButtons = CustomToggleButtons(
      tabs: ordersStates,
      selectedIndex: selectedIndex,
    );
    return AppBarWithToggleButtons(toggleButtons: toggleButtons);
  }
}
