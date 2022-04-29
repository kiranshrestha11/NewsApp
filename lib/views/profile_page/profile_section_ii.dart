import 'package:flutter/material.dart';

class ProfileSectionII extends StatelessWidget {
  const ProfileSectionII({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(width: 1.0, color: Colors.black),
            ),
            onPressed: () {},
            child: Text(
              "Edit Profile",
              style:
                  TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
            )),
        SizedBox(
          width: 10,
        ),
        Container(
          width: 30,
          height: 34,
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(3)),
          margin: EdgeInsets.all(8),
          child: Icon(Icons.bookmark_outline),
        )
      ],
    );
  }
}
