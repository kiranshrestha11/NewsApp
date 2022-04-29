import 'package:flutter/material.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/components/textfield_container.dart';

class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField(
      {Key? key,
      required this.onChanged,
      required this.textcontroller,
      this.textInputAction = TextInputAction.done,
      required this.validation,
      required this.formKey})
      : super(key: key);

  final ValueChanged<String> onChanged;
  final bool isObcure = true;
  final TextEditingController textcontroller;
  final TextInputAction textInputAction;
  final String? Function(String?)? validation;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: textcontroller,
        obscureText: isObcure,
        onChanged: onChanged,
        validator: validation,
        keyboardType: TextInputType.visiblePassword,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
