import 'package:clean_app/general_commponent/default_button.dart';
import 'package:clean_app/presentation/resourses/color_manager.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:flutter/material.dart';

class SignatureWidget extends StatelessWidget {
  const SignatureWidget({Key? key, required this.onConfirmPressed})
      : super(key: key);
  final VoidCallback? onConfirmPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Signiture',
          style: getRegularStyle(fontSize: 18),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Flexible(
                child: DefaultButton(
              onPressed: null,
              background: ColorManager.primaryOpacity70,
              text: 'Password',
              horizontalMargin: 0,
            )),
            SizedBox(width: 20),
            Flexible(
                child: DefaultButton(
              onPressed: onConfirmPressed,
              text: 'Confirm',
              horizontalMargin: 0,
            )),
            Expanded(flex: 1, child: Container()),
          ],
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
