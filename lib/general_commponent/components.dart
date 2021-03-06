import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:common_widgets/accuracy_good_bad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

Widget onBoardText(String title, String description) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: getSemiBoldStyle(
            fontSize: 28,
          ),
        ),
        // SizedBox(
        //   height: 29,
        // ),
        // Text(
        //   description,
        //   textAlign: TextAlign.center,
        //   style: getRegularStyle(fontSize: 20, color: Colors.black),
        // ),
      ],
    );

Future To(BuildContext context, Widget widget) async {
  return await Navigator.of(context)
      .push(MaterialPageRoute(builder: (BuildContext context) => widget));
}

Future ToAndFinish(BuildContext context, Widget widget) async {
  return Navigator.pushAndRemoveUntil<dynamic>(
    context,
    MaterialPageRoute<dynamic>(builder: (BuildContext context) => widget),
    (route) => false, //if you want to disable back feature set to false
  );
}

TextStyle defaultTextStyleHint() => TextStyle(
      fontSize: 14,
      color: defaultHint,
      fontWeight: FontWeight.w600,
    );

Widget buildIcon(String path, {double? size, Color? color}) {
  final double iconSize = size ?? 16.w;

  return Builder(builder: (context) {
    return Image.asset(path, width: iconSize, height: iconSize, color: color);
  });
}

Widget defaultTextForm(
  TextEditingController controller,
  String hint, {
  int? maxLines,
  Widget? icon,
  bool isPassword = false,
  String? Function(String?)? validator,
  String? defaultValidator,
  TextInputType type = TextInputType.text,
  ValueKey? key,
  double? width,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        10,
      ),
      color: Color(0xffEBF2F8),
    ),
    child: TextFormField(
      maxLines: isPassword ? 1 : maxLines,
      controller: controller,
      style: getRegularStyle(fontSize: 16),
      textAlignVertical: TextAlignVertical.center,
      obscureText: isPassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        border: InputBorder.none,
        isDense: true,
        hintText: hint,
        hintStyle: defaultTextStyleHint(),
        suffixIcon: icon == null
            ? null
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon,
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
        //icon:icon ,
        // prefixIconConstraints: BoxConstraints(minWidth: 30, minHeight: 30),
      ),
      validator: validator ??
          (str) {
            return defaultValidator;
          },
      keyboardType: type,
    ),
  );
}

Widget ratingRow(String title, double val1, double val2) => Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(title, style: getRegularStyle())),
              Expanded(
                  child: AccuracyGoodBad(
                goodValue: val1,
                badValue: val2,
              )),
            ],
          ),
        ),
        Divider(
          thickness: 1,
        ),
      ],
    );

Widget headerText(String text,
    {double fontSize = 18, Color? textColor, FontWeight? fontWeight}) {
  return Builder(builder: (context) {
    if (textColor == null) textColor = Theme.of(context).primaryColor;
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize, color: textColor, fontWeight: fontWeight),
    );
  });
}

Widget divider({double thickness = 1.5, Color? color}) {
  return Builder(builder: (context) {
    return Divider(
        thickness: 1.5, color: color ?? Theme.of(context).primaryColor);
  });
}
