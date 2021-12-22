import 'dart:math';

import 'package:common_widgets/border_container_light.dart';
import 'package:common_widgets/custom_stepper.dart';
import 'package:common_widgets/default_button.dart';
import 'package:clean_app/screens/orders_management/add_order/choose_order_prodcuts.dart';
import 'package:clean_app/screens/orders_management/add_order/choose_stores.dart';
import 'package:clean_app/screens/orders_management/add_order/order_pricing.dart';
import 'package:clean_app/screens/orders_management/add_order/success_order.dart';

import 'package:common_widgets/custom_toggle_buttons.dart';
import 'package:clean_app/widgets/store_owner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddOrders extends StatefulWidget {
  AddOrders({Key? key}) : super(key: key);

  @override
  State<AddOrders> createState() => _AddOrdersState();
}

class _AddOrdersState extends State<AddOrders> {
  _AddOrdersState() {
    steppers = [
      StepDescription('Choose stores', () {
        onChangeSelected(0);
      },
          page: ChooseOrderStores(
            onNexPagePressed: () => onChangeSelected(1),
          )),
      StepDescription('Choose products', () {
        onChangeSelected(1);
      },
          page: ChooseOrderProducts(
            onNextButtonPressed: () => onChangeSelected(2),
          )),
      StepDescription('Pricing', () {
        onChangeSelected(2);
      }, page: OrderPricing(
        sendingOnPressed: () {
          onChangeSelected(3);
        },
      )),
    ];
  }
  late List<StepDescription> steppers;

  int selectedIndex = 0;

  void onChangeSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [_stepper(height), _getPageToDisplay()],
      ),
    );
  }

  Widget _getPageToDisplay() {
    if (selectedIndex == steppers.length)
      return SuccessOrder();
    else
      return steppers[selectedIndex].page;
  }

  Widget _stepper(double height) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
      width: MediaQuery.of(context).size.width,
      child: BorderContainerLight(
        child: FittedBox(
          child: SizedBox(
            height: height * 0.14,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CustomStepper(steppers, selectedIndex),
            ),
          ),
        ),
      ),
    );
  }
}
