import 'package:flutter/material.dart';
import 'package:news_app/views/home/home_section.dart';
import 'package:news_app/views/menu_page.dart';
import 'package:news_app/views/my_next_page.dart';
import 'package:news_app/views/profile_page.dart';
import 'package:news_app/views/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  getIndex() {}

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2;
  final List screens = [
    ProfilePage(),
    MyNextPage(),
    HomeSection(),
    SearchPage(),
    MenuPage()
  ];
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 20),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
              iconSize: 30,
              unselectedFontSize: 10,
              currentIndex: _currentIndex,
              showSelectedLabels: false,
              type: BottomNavigationBarType.fixed,
              elevation: 20.0,
              selectedItemColor: Colors.white,
              onTap: (index) => setState(() {
                    _currentIndex = index;
                  }),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: _currentIndex == 0
                      ? CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xffD8227A),
                          child: Icon(
                            Icons.account_circle_outlined,
                            color: Colors.white,
                          ),
                        )
                      : Icon(Icons.account_circle_outlined),
                  label: "Name",
                ),
                BottomNavigationBarItem(
                    icon: _currentIndex == 1
                        ? CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xffD8227A),
                            child: Icon(
                              Icons.run_circle_outlined,
                              color: Colors.white,
                            ),
                          )
                        : Icon(Icons.run_circle_outlined),
                    label: "My Next"),
                BottomNavigationBarItem(
                    icon: _currentIndex == 2
                        ? CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xffD8227A),
                            child: Icon(
                              Icons.home_rounded,
                              color: Colors.white,
                            ),
                          )
                        : Icon(Icons.home_rounded),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: _currentIndex == 3
                        ? CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xffD8227A),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          )
                        : Icon(Icons.search),
                    label: "Search"),
                BottomNavigationBarItem(
                    icon: _currentIndex == 4
                        ? CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xffD8227A),
                            child: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                          )
                        : Icon(Icons.menu),
                    label: "Menu"),
              ]),
        ),
      ),
    );
  }
}
