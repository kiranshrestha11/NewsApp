import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/utils/constants.dart';

class SocalIcon extends StatelessWidget {
  final String iconSrc;
  final Function()? press;
  const SocalIcon({
    Key? key,
    required this.iconSrc,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: kPrimaryLightColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSrc,
          color: kPrimaryColor,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
