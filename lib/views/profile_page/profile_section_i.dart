import 'package:flutter/material.dart';

class ProfileSectionI extends StatelessWidget {
  const ProfileSectionI({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              "Projects",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "12",
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
        Column(
          children: [
            Text(
              "Following",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "210",
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
        Column(
          children: [
            Text(
              "Followers",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "108",
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ],
    );
  }
}
