import 'package:flutter/material.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/components/textfield_container.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    required this.controller,
    required this.keyboradtype,
    required this.validation,
    this.obcure = false,
    required this.formKey,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final TextInputType keyboradtype;
  final TextInputAction textInputAction;
  final String? Function(String?)? validation;
  final bool obcure;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        keyboardType: keyboradtype,
        validator: validation,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
