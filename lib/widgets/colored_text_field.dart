import 'package:clean_app/presentation/resourses/color_manager.dart';
import 'package:common_widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';

class ColoredTextField extends StatelessWidget {
  const ColoredTextField({
    Key? key,
    required this.controller,
    required this.hint,
    this.type = TextInputType.text,
    this.validator,
    this.icon,
    this.isPassword = false,
    this.maxLines = 1,
  }) : super(key: key);
  final TextEditingController controller;
  final String hint;
  final TextInputType type;
  final String? Function(String? val)? validator;
  final Widget? icon;
  final bool isPassword;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DefaultTextFormField(
          backgroundColor: ColorManager.primary.withAlpha(15),
          controller: controller,
          hint: hint,
          type: type,
          icon: icon,
          validator: validator,
          isPassword: isPassword,
          width: 30,
          maxLines: maxLines
          // width: 170,
          ),
    );
  }
}
