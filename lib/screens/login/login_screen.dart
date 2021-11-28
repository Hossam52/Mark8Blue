import 'package:clean_app/general_commponent/components.dart';
import 'package:clean_app/general_commponent/default_button.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:clean_app/screens/conditions/conditions_screen.dart';
import 'package:clean_app/screens/home/home_screen.dart';
import 'package:clean_app/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen(
      {Key? key, this.hasRegisterButton = true, required this.logoPath})
      : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
  final bool hasRegisterButton;
  final String logoPath;
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController name = TextEditingController()..text = '';
  TextEditingController password = TextEditingController()..text = '';

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _background(context),
            SizedBox(
              height: 21,
            ),
            _logo(),
            SizedBox(
              height: 35,
            ),
            _inputFields(),
            SizedBox(
              height: 32,
            ),
            _signInButton(context),
            _loginActions(getColor),
            SizedBox(
              height: 50,
            ),
            if (widget.hasRegisterButton) _register(context),
          ],
        ),
      ),
    );
  }

  Padding _register(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100),
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              To(context, ConditionsScreen());
            },
            child: Text(
              "تسجيل",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          ),
          Text("ليس لديك حساب؟"),
        ],
      ),
    );
  }

  Padding _loginActions(Color getColor(Set<MaterialState> states)) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            child: Text(
              "طلب مساعدة؟",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 12,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Padding _signInButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DefaultButton(
          // background: Color(0xff95989A),
          text: 'Login',
          onPressed: () {
            ToAndFinish(context, HomeScreen());
          }
          //fetchApiLogin
          ),
    );
  }

  Widget _logo() {
    return Builder(builder: (context) {
      return Column(
        children: [
          Image.asset(
            widget.logoPath,
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.width * 0.3,
          ),
          SizedBox(
            height: 25.h,
          ),
          Text("Sign In",
              style: getBoldStyle(
                  fontSize: 23, color: Theme.of(context).primaryColor))
        ],
      );
    });
  }

  Container _background(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: double.infinity,
      child: Image.asset(
        "asset/images/loginImage.png",
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _inputFields() {
    return Column(
      children: [
        defaultTextForm(
          name,
          ' Phone number or nickname',
          type: TextInputType.emailAddress,
          icon: buildIcon(
            "asset/images/user.png",
          ),
          key: ValueKey("email"),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter a valid email address or phone';
            }
            return null;
          },
        ),
        SizedBox(
          height: 16,
        ),
        defaultTextForm(
          password,
          'Password',
          type: TextInputType.text,
          icon: buildIcon(
            "asset/images/hide.png",
          ),
          key: ValueKey("email"),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter a valid email address or phone';
            }
            return null;
          },
          // width: 170,
        )
      ],
    );
  }
}
