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
    MyNextPage(
      categoryName: "General",
    ),
    HomeSection(),
    SearchPage(
      query: "India",
    ),
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
                      ? AvatarWidget(
                          iconData: Icons.account_circle_outlined,
                        )
                      : Icon(Icons.account_circle_outlined),
                  label: "Name",
                ),
                BottomNavigationBarItem(
                    icon: _currentIndex == 1
                        ? AvatarWidget(
                            iconData: Icons.run_circle_outlined,
                          )
                        : Icon(Icons.run_circle_outlined),
                    label: "My Next"),
                BottomNavigationBarItem(
                    icon: _currentIndex == 2
                        ? AvatarWidget(
                            iconData: Icons.home_rounded,
                          )
                        : Icon(Icons.home_rounded),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: _currentIndex == 3
                        ? AvatarWidget(iconData: Icons.search)
                        : Icon(Icons.search),
                    label: "Search"),
                BottomNavigationBarItem(
                    icon: _currentIndex == 4
                        ? AvatarWidget(iconData: Icons.menu)
                        : Icon(Icons.menu),
                    label: "Menu"),
              ]),
        ),
      ),
    );
  }
}

class AvatarWidget extends StatelessWidget {
  AvatarWidget({
    Key? key,
    required this.iconData,
  }) : super(key: key);
  IconData iconData;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Color(0xffD8227A),
      child: Icon(
        iconData,
        color: Colors.white,
      ),
    );
  }
}
