import 'package:clean_app/general_commponent/default_button.dart';
import 'package:clean_app/presentation/resourses/color_manager.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:flutter/material.dart';

class SuccessOrder extends StatelessWidget {
  const SuccessOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _orderId(),
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
        Text('Order had delivered', style: getRegularStyle(fontSize: 18)),
        SizedBox(height: 10),
        Text('Sending time 12:30 AM 15/9/2021',
            style: getRegularStyle(
                color: Theme.of(context).primaryColor, fontSize: 15)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
          child: DefaultButton(
            onPressed: () {},
            text: 'Back to main',
            radius: 5,
          ),
        )
      ],
    );
  }

  Widget _orderId() {
    return Center(
      child: Text('OID  7785210211',
          style: getRegularStyle(color: ColorManager.lightGrey, fontSize: 18)),
    );
  }
}
