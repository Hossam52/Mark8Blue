import 'package:clean_app/general_commponent/components.dart';
import 'package:clean_app/general_commponent/default_button.dart';
import 'package:clean_app/presentation/resourses/color_manager.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:clean_app/screens/maps/delivery_location_map.dart';
import 'package:clean_app/screens/orders_management/add_order/success_order.dart';
import 'package:clean_app/widgets/custom_toggle_buttons.dart';
import 'package:clean_app/widgets/table_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderPricing extends StatelessWidget {
  OrderPricing({Key? key, required this.sendingOnPressed}) : super(key: key);
  final VoidCallback sendingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _orderId(),
          _orderData(),
          Text(
            'Choose payment method',
            style: getSemiBoldStyle(fontSize: 18),
          ),
          _paymentMethods(),
          _recieveOrderLocation(context),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: DefaultButton(
              onPressed: sendingOnPressed,
              text: 'Send order',
            ),
          )
        ],
      ),
    );
  }

  Widget _orderId() {
    return Center(
      child: Text('OID  7785210211',
          style: getRegularStyle(fontSize: 22, color: ColorManager.lightGrey)),
    );
  }

  Widget _orderData() {
    List<TableRowItem> rows = [
      TableRowItem(
          title: 'Markets count', widget: Text('2', style: getRegularStyle())),
      TableRowItem(
          title: 'Total stores count',
          widget: Text('5', style: getRegularStyle())),
      TableRowItem(
          title: 'Total products',
          widget: Text('20', style: getRegularStyle())),
      TableRowItem(
        title: 'Total weight',
        widget: _valueWithUnit('5', 'KG'),
      ),
      TableRowItem(
        title: 'Order commision',
        widget: _valueWithUnit('50', 'PSD'),
      ),
      TableRowItem(
        title: 'Total price',
        widget: _valueWithUnit('30', 'JD'),
      ),
    ];
    return TableDataWidget(rows: rows);
  }

  RichText _valueWithUnit(String value, String unit) {
    return RichText(
      text: TextSpan(text: '$value \t', style: getRegularStyle(), children: [
        TextSpan(
          text: '$unit ',
          style: getRegularStyle(color: Colors.grey),
        )
      ]),
    );
  }

  Widget _paymentMethods() {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Row(
            children: [
              Image.asset('asset/images/cash.png'),
              SizedBox(width: 15),
              Text(
                'Cash',
                style: getRegularStyle(
                    fontSize: 18, color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _recieveOrderLocation(context) {
    final List<ToggleItemData> recievingLocationTabs = [
      ToggleItemData(
          title: 'Recieving locations',
          onPressed: () {
            To(context, DeliveryLocationMap());
          }),
      ToggleItemData(
          title: 'My home',
          onPressed: () {
            To(context, DeliveryLocationMap());
          }),
    ];
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose recieving order location',
            style: getRegularStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          SizedBox(child: CustomToggleButtons(tabs: recievingLocationTabs))
        ],
      );
    });
  }
}
