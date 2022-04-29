import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/data/model/login_model.dart';
import 'package:news_app/views/home/home_page.dart';
import 'package:news_app/views/login/background.dart';
import 'package:news_app/components/account_check.dart';
import 'package:news_app/components/rounded_button.dart';
import 'package:news_app/components/rounded_input_field.dart';
import 'package:news_app/components/rounded_password_field.dart';
import 'package:news_app/views/signup/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackGround(
          child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                formKey: _formkey,
                controller: emailController,
                keyboradtype: TextInputType.emailAddress,
                hintText: "Your Email",
                onChanged: (value) {
                  //return _controller;
                },
                validation: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  return RegExp(pattern).hasMatch(value!)
                      ? null
                      : "Please Enter valid Email.";
                },
              ),
              RoundedPasswordField(
                formKey: _formkey,
                textcontroller: passwordController,
                validation: (value) {
                  if (value!.isEmpty || value.length < 7) {
                    return "Enter characters more than 7.";
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              RoundedButton(
                  text: "LOGIN",
                  press: () async {
                    if (_formkey.currentState!.validate()) {
                      LoginModel loginModel = LoginModel(
                          password: passwordController.text,
                          email: emailController.text);
                      log(loginModel.toJson().toString());
                      SharedPreferences _prefs =
                          await SharedPreferences.getInstance();
                      _prefs.setBool('loggedin', true);
                      _prefs.setString(
                          "userData", jsonEncode(loginModel.toJson()));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(
                            milliseconds: 600,
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.green,
                          content: Text('Hello ${loginModel.email}'),
                        ),
                      );

                      Future.delayed(
                        const Duration(milliseconds: 5),
                        () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage()));
                        },
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(
                            milliseconds: 600,
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.red,
                          content: Text('Invalid Form Data'),
                        ),
                      );
                    }
                  }),
              SizedBox(height: size.height * 0.03),
              AccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignpPage();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
