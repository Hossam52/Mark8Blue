import 'dart:math';

import 'package:clean_app/general_commponent/colors.dart';
import 'package:clean_app/general_commponent/components.dart';
import 'package:common_widgets/border_container_light.dart';
import 'package:common_widgets/build_icon.dart';
import 'package:common_widgets/components.dart';
import 'package:common_widgets/confirm_arrival.dart';
import 'package:common_widgets/custom_stepper.dart';
import 'package:common_widgets/default_button.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:clean_app/screens/Rating/rating_screen.dart';
import 'package:clean_app/widgets/store_owner_widget.dart';
import 'package:common_widgets/recieving_table.dart';
import 'package:common_widgets/table_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryPage extends StatefulWidget {
  DeliveryPage({Key? key}) : super(key: key);

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  @override
  void initState() {
    princingSteppers = [
      StepDescription('Delivery pricing', () {}, page: _DeliveryStepperItem(
        onConfirmPressed: () {
          setState(() {
            selectedPricingStepper = 1;
          });
        },
      )),
      StepDescription('Purchases pricing', () {}, page: _PurchaseStepperItem()),
    ];
    super.initState();
  }

  late List<StepDescription> princingSteppers;
  int selectedPricingStepper = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: height * 0.18, child: _remainToRecieve()),
          Divider(),
          StoreOwnerWidget(),
          SizedBox(height: 10),
          ConfimrArrival(
            arrivalTime: '12:30 AM 15/9/2021',
          ),
          Divider(),
          _pricintDetails(height),
          princingSteppers[selectedPricingStepper].page,
        ],
      ),
    );
  }

  Widget _remainToRecieve() {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(
                  text: 'Remain to recieve',
                  style: getRegularStyle(fontSize: 18),
                  children: [
                TextSpan(
                    text: '/ 2',
                    style: getRegularStyle(
                        fontSize: 18, color: Theme.of(context).primaryColor))
              ])),
          Expanded(
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (_, index) => _RemainForRecievingItem(
                          isSelected: Random.secure().nextBool(),
                        )),
              ),
            ),
          )
        ],
      );
    });
  }

  Widget _pricintDetails(height) {
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
              child: CustomStepper(princingSteppers, selectedPricingStepper),
            ),
          ),
        ),
      ),
    );
  }
}

class _RemainForRecievingItem extends StatelessWidget {
  const _RemainForRecievingItem({Key? key, this.isSelected = false})
      : super(key: key);
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      constraints: BoxConstraints(maxWidth: width / 4.5),
      padding: const EdgeInsets.all(5),
      color: isSelected ? selectedItemColor : null,
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: FittedBox(
                child: Text('55441123699', style: TextStyle(color: Colors.red)),
              ),
            ),
            Expanded(
                flex: 2,
                child: Image.asset(
                  'asset/images/black_bag.png',
                  color: Colors.red,
                )),
            SizedBox(height: 5),
            Expanded(
              child: FittedBox(
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.red),
                      text: '2021/10/20 ',
                      children: [
                        TextSpan(
                          text: '11:30AM',
                          style: TextStyle(color: Colors.green),
                        )
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///////////////// Purchasing stepper/////
class _PurchaseStepperItem extends StatelessWidget {
  _PurchaseStepperItem({Key? key}) : super(key: key);
  final List<TableRowItem> _purchaseTableRows =
      invoiceData(id: '5544123699', discount: 5, commission: 1, totalPrice: 94);
  @override
  Widget build(BuildContext context) {
    return RecievingTableWidget(
        time: '12:30 AM 15/9/2021',
        tableData: _purchaseTableRows,
        onPayInvoicePressed: () {},
        onConfirmPressed: () => _confirmPurchase(context));
  }

  void _confirmPurchase(context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        child: _ReviewDialog(),
      ),
    );
  }
}

///////////////// Delivery stepper/////////
class _DeliveryStepperItem extends StatelessWidget {
  _DeliveryStepperItem({Key? key, required this.onConfirmPressed})
      : super(key: key);
  final VoidCallback onConfirmPressed;
  final List<TableRowItem> _deliveryTableRows = [
    TableRowItem(title: 'Total stores', widget: Text('3')),
    TableRowItem(title: 'Total weight', widget: Text('12 KG')),
    TableRowItem(title: 'Delivery commision', widget: Text('1 PSD')),
    TableRowItem(title: 'Total delivery cost', widget: Text('3 JD')),
    TableRowItem(title: 'Total price', widget: Text('2 JD')),
    TableRowItem(
        title: 'Payment method',
        widget: BuildIcon(path: 'asset/images/cash.png', size: 30.r)),
  ];
  @override
  Widget build(BuildContext context) {
    return RecievingTableWidget(
      time: '12:30 AM 15/9/2021',
      onPayInvoicePressed: () {},
      tableData: _deliveryTableRows,
      onConfirmPressed: onConfirmPressed,
    );
  }
}

//Revirew Dialog
class _ReviewDialog extends StatelessWidget {
  const _ReviewDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          Image.asset(
            'asset/images/success.png',
            scale: 2,
          ),
          SizedBox(height: 10),
          Text('Congratulations!!',
              style: getLightStyle(
                  color: Theme.of(context).primaryColor, fontSize: 18)),
          SizedBox(height: 10),
          Text('Do you want to make reviews about order products?',
              textAlign: TextAlign.center,
              style: getRegularStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text('Sending time 12:30 AM 15/9/2021',
              style: getRegularStyle(
                  color: Theme.of(context).primaryColor, fontSize: 15)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
            child: _actions(context),
          )
        ],
      ),
    );
  }

  Widget _actions(context) {
    return Row(
      children: [
        Expanded(
          child: DefaultButton(
            onPressed: () async {
              Navigator.pop(context);
              await To(context, RatingScreen());
            },
            text: 'Review',
            horizontalMargin: 0,
            radius: 5,
          ),
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: DefaultButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: 'Ignore',
            horizontalMargin: 0,
            // textColor: Colors.white,
            background: Colors.white,
            isBorder: true,
            radius: 5,
          ),
        ),
      ],
    );
  }
}
