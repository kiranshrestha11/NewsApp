import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 0,
                left: 0,
                child: Image.asset("assets/images/main_top.png")),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset("assets/images/login_bottom.png"),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
