import 'package:flutter/material.dart';
import 'package:news_app/data/model/news_category_model.dart';
import 'package:news_app/views/home/section_i.dart';
import 'package:news_app/views/home/section_ii.dart';
import 'package:news_app/views/home/section_iii.dart';
import 'package:news_app/views/my_next_page.dart';
import 'package:news_app/views/search_page.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  final TextEditingController _controller = TextEditingController();
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 42, 10, 0),
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
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade700,
                        fontSize: 17),
                    hintText: "Search Latest News",
                    border: InputBorder.none,
                  )),
            ),
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SectionI(),
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
