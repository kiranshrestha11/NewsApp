import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 42, 10, 0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(20.0)),
              child: Expanded(
                child: TextField(
                    autocorrect: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                          fontSize: 17),
                      hintText: "Search Latest News",
                      border: InputBorder.none,
                    )),
              ),
            ),
          )),
      body: Container(
          //color: Colors.blueAccent,
          ),
      //bottomNavigationBar: BottomNavigationBar(items: []),
    );
  }
}
