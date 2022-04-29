import 'dart:developer';

import 'package:flutter/material.dart';

class FormValidate extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _hellokey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
              key: _hellokey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(hintText: "Enter your Name"),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter your Name";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(hintText: "Enter your Name"),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter your Email";
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_hellokey.currentState!.validate()) {
                            log("message");
                          }
                        },
                        child: Text("Submit"))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
