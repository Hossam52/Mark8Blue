import 'package:clean_app/general_commponent/colors.dart';
import 'package:clean_app/general_commponent/components.dart';
import 'package:clean_app/general_commponent/default_button.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:clean_app/screens/home/home_screen.dart';
import 'package:clean_app/screens/login/login_screen.dart';
import 'package:clean_app/widgets/background_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          BackgroundImage('asset/images/loginImage.png'),
          SizedBox(
            height: 18,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Center(
              child: Text(
                "New Account",
                style: getBoldStyle(
                  fontSize: 24,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          _buildNameFields(),
          SizedBox(height: 16),
          _buildNickName(),
          SizedBox(height: 16),
          _buildPhone(),
          SizedBox(height: 16),
          _buiildPassword(),
          SizedBox(height: 16),
          _buildConfirmPassword(),
          SizedBox(height: 32),
          _buildRegister(context),
          SizedBox(height: 20),
          _buildGoToLogin(context),
        ],
      ),
    ));
  }

  Padding _buildGoToLogin(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100),
      child: Row(
        children: [
          Text("Already registered?"),
          TextButton(
            onPressed: () {
              To(context, LoginScreen());
            },
            child: Text(
              "Log in",
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding _buildRegister(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DefaultButton(
          background: defaultColor,
          text: 'Register ',
          onPressed: () {
            To(context, HomeScreen());
          }
          //fetchApiLogin
          ),
    );
  }

  Widget _buildConfirmPassword() {
    return defaultTextForm(nameController, "Confirm password",
        type: TextInputType.text,
        icon: buildIcon("asset/images/hide.png"), validator: (value) {
      if (value!.isEmpty) {
        return 'Please enter a valid email address or phone';
      }
      return null;
    }, width: 10);
  }

  Widget _buiildPassword() {
    return defaultTextForm(
      nameController,
      "Password",
      type: TextInputType.text,
      icon: buildIcon("asset/images/hide.png"),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a valid email address or phone';
        }
        return null;
      },
      width: 180,
      // width: 170,
    );
  }

  Widget _buildPhone() {
    return defaultTextForm(
      nameController,
      "Phone number",
      type: TextInputType.number,
      icon: buildIcon(
        "asset/images/phone_icon.png",
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a valid email address or phone';
        }
        return null;
      },
      width: 180,
      // width: 170,
    );
  }

  Widget _buildNickName() {
    return defaultTextForm(
      nameController,
      "NickName",
      type: TextInputType.text,
      icon: buildIcon("asset/images/user.png"),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a valid email address or phone';
        }
        return null;
      },
      width: 180,
      // width: 170,
    );
  }

  Row _buildNameFields() {
    return Row(
      children: [
        Expanded(
          child: defaultTextForm(
            nameController,
            "First name",
            type: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a valid email address or phone';
              }
              return null;
            },
            width: 40,
          ),
        ),
        Expanded(
          child: defaultTextForm(
            nameController,
            "Last name",
            type: TextInputType.text,

            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a valid email address or phone';
              }
              return null;
            },
            width: 30,
            // width: 170,
          ),
        ),
      ],
    );
  }
}
