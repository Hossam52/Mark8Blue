import 'package:clean_app/presentation/resourses/color_manager.dart';
import 'package:clean_app/widgets/colored_text_field.dart';
import 'package:common_widgets/build_icon.dart';
import 'package:common_widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:clean_app/presentation/resourses/styles_manager.dart';
import 'package:clean_app/screens/home/home_screen.dart';
import 'package:clean_app/screens/login/login_screen.dart';
import 'package:clean_app/general_commponent/colors.dart';
import 'package:clean_app/general_commponent/components.dart';
import 'package:common_widgets/default_button.dart';
import 'package:clean_app/widgets/background_image.dart';

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
          _buildNickName(),
          _buildPhone(),
          _buiildPassword(),
          _buildConfirmPassword(),
          SizedBox(height: 20),
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
              To(
                  context,
                  LoginScreen(
                    logoPath: 'asset/images/login_logo.png',
                  ));
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
    return ColoredTextField(
      controller: nameController,
      hint: "Confirm password",
      type: TextInputType.text,
      icon: BuildIcon(path: "asset/images/hide.png"),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a valid email address or phone';
        }
        return null;
      },
    );
  }

  Widget _buiildPassword() {
    return ColoredTextField(
      controller: nameController,
      hint: "Password",
      type: TextInputType.text,
      icon: BuildIcon(path: "asset/images/hide.png"),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a valid email address or phone';
        }
        return null;
      },
    );
  }

  Widget _buildPhone() {
    return ColoredTextField(
      controller: nameController,
      hint: "Phone number",
      type: TextInputType.number,
      icon: BuildIcon(
        path: "asset/images/phone_icon.png",
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a valid email address or phone';
        }
        return null;
      },
    );
  }

  Widget _buildNickName() {
    return ColoredTextField(
      controller: nameController,
      hint: "NickName",
      type: TextInputType.text,
      icon: BuildIcon(path: "asset/images/user.png"),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a valid email address or phone';
        }
        return null;
      },
    );
  }

  Row _buildNameFields() {
    return Row(
      children: [
        Expanded(
          child: ColoredTextField(
            controller: nameController,
            hint: "First name",
            type: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a valid email address or phone';
              }
              return null;
            },
          ),
        ),
        Expanded(
          child: ColoredTextField(
            controller: nameController,
            hint: "Last name",
            type: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a valid email address or phone';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
