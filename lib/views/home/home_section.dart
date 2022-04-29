// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/data/model/news_category_model.dart';
import 'package:news_app/views/home/section_i.dart';
import 'package:news_app/views/home/section_ii.dart';
import 'package:news_app/views/home/section_iii.dart';
import 'package:news_app/views/login/login_page.dart';
import 'package:news_app/views/my_next_page.dart';
import 'package:news_app/views/search_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  final TextEditingController _controller = TextEditingController();
  String query = '';

  late bool loggedIn;

  getLogin() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      loggedIn = _prefs.getBool('loggedin') == null ? false : true;
    });
  }

  @override
  void initState() {
    getLogin();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 42, 10, 0),
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              margin: EdgeInsets.only(bottom: 1.5),
              decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(20.0)),
              child: Expanded(
                child: TextField(
                    onSubmitted: (value) {
                      setState(() {
                        value = _controller.text;
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return SearchPage(
                            query: value,
                          );
                        }));
                      });
                    },
                    controller: _controller,
                    autocorrect: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700,
                        fontSize: 16,
                      ),
                      hintText: "Search Latest News",
                      border: InputBorder.none,
                    )),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SectionI(),
          if (loggedIn)
            SizedBox.shrink()
          else
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 12, right: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xffD8227A),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffD8227A).withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              height: 40,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Login to Explore more News.",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.7)),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginPage()));
                      },
                      child: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          alignment: Alignment.center,
                          height: 26,
                          width: 58,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          SectionII(),
          SectionIII(),
        ],
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  const CategorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categoryList.length,
      itemBuilder: (context, index) {
        final String cat = categoryList[index].categoryName;
        return Padding(
          padding: const EdgeInsets.only(right: 12, top: 3),
          child: Column(
            children: [
              InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyNextPage(
                          categoryName: cat,
                        ))),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xffD8227A),
                  child: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.grey[100],
                      backgroundImage:
                          NetworkImage(categoryList[index].imgUrl)),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                categoryList[index].categoryName,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
      },
    );
  }
}
