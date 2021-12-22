import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clean_app/presentation/resourses/color_manager.dart';
import 'package:clean_app/screens/signup/signup_screen.dart';
import 'package:clean_app/constants/const_texts.dart';
import 'package:clean_app/general_commponent/colors.dart';
import 'package:clean_app/general_commponent/components.dart';
import 'package:common_widgets/default_button.dart';
import 'package:clean_app/widgets/background_image.dart';

class ConditionsScreen extends StatefulWidget {
  @override
  _ConditionsScreenState createState() => _ConditionsScreenState();
}

class _ConditionsScreenState extends State<ConditionsScreen> {
  bool isChecked = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            flex: 1, child: BackgroundImage('asset/images/loginImage.png')),
        SizedBox(height: 20.h),
        Text(
          "شروط واحكام الاستخدام",
          style: TextStyle(
            fontSize: 16.h,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 17.h,
        ),
        _buildConditionsArea(),
        _buildAgreeConditions(),
        _buildStartRegister()
      ],
    ));
  }

  Widget _buildConditionsArea() {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            CONDITION_AND_TERMS + CONDITION_AND_TERMS,
            style: TextStyle(fontSize: 16.sp, color: ColorManager.lightGrey),
          ),
        ),
      ),
    );
  }

  Widget _buildAgreeConditions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "أوافق على شروط الخدمة",
          style: TextStyle(
              fontSize: 15.sp, fontWeight: FontWeight.w200, color: Colors.grey),
        ),
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
        ),
      ],
    );
  }

  Widget _buildStartRegister() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: DefaultButton(
          // background: defaultColor,
          text: 'بدء التسجيل',
          onPressed: () {
            ToAndFinish(context, SignupScreen());
          }
          //fetchApiLogin
          ),
    );
  }
}
