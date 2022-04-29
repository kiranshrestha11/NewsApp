import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/components/account_check.dart';
import 'package:news_app/components/rounded_button.dart';
import 'package:news_app/components/rounded_input_field.dart';
import 'package:news_app/components/rounded_password_field.dart';
import 'package:news_app/views/login/login_page.dart';
import 'package:news_app/views/signup/components/background.dart';
import 'package:news_app/views/signup/components/or_divider.dart';
import 'package:news_app/views/signup/components/social_icon.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              'assets/icons/signup.svg',
              height: size.height * 0.35,
            ),
            RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {},
                controller: emailController,
                keyboradtype: TextInputType.emailAddress,
                validation: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  return RegExp(pattern).hasMatch(value!)
                      ? null
                      : "Please Enter valid Email.";
                },
                formKey: _formkey),
            RoundedPasswordField(
                onChanged: (value) {},
                textcontroller: passwordController,
                validation: (value) {
                  if (value!.isEmpty || value.length < 7) {
                    return "Enter characters more than 7.";
                  }
                  return null;
                },
                formKey: _formkey),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                    ),
                  );
                }),
            OrDivider(),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
