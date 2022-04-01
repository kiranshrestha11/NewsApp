import 'package:flutter/material.dart';
import 'package:news_app/views/home/news_detail_page.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

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
        children: [
          SectionI(),
          SectionII(),
          SectionIII(),
          SectionIII(),
          SectionIII(),
          SectionIII(),
          SectionIII(),
          SectionIII(),
        ],
      ),
    );
  }
}

class SectionIII extends StatelessWidget {
  const SectionIII({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 10),
      height: 100,
      width: double.infinity,
      child: Row(
        children: [
          Image.network(
            "https://a.espncdn.com/combiner/i?img=/photo/2022/0329/r992732_1296x1296_1-1.jpg",
            height: 94,
            width: 99,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 3),
                width: 237,
                height: 80,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Repeat safety violations, critical resource shortages",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          "Since 2019, nearly three-quarters of Arizona’s 130 outpatient dialysis..",
                          style: TextStyle(color: Colors.black54)),
                    ]),
              ),
              Container(
                margin: EdgeInsets.only(left: 3),
                height: 20,
                width: 237,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("1 hrs ago",
                        style:
                            TextStyle(fontSize: 12, color: Color(0xffAAACAD))),
                    InkWell(
                      splashColor: Color(0xff40A3CC),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NewsDetailPage()));
                      },
                      child: Row(
                        children: [
                          Text(
                            "Read More",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xff40A3CC)),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: Color(0xff40A3CC),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class SectionI extends StatelessWidget {
  const SectionI({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 82,
      margin: EdgeInsets.all(9),
      child: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          CategorySection(
            imgUrl:
                "https://trendinnovationsholding.com/wp-content/uploads/2022/02/nathan-dumlao-LYn1Dyqqukc-unsplash-3-427x319.jpg",
            categoryName: "Trending",
          ),
          CategorySection(
            imgUrl:
                "https://www.activateuts.com.au/wp-content/uploads/2022/02/UTSSport_Hero_TEST_Landscape-1536x1143.jpg",
            categoryName: "Sports",
          ),
          CategorySection(
              categoryName: "Business",
              imgUrl:
                  "https://imageio.forbes.com/blogs-images/alejandrocremades/files/2018/12/business-3605367_1920-1200x741.jpg"),
          CategorySection(
              categoryName: "Fashion",
              imgUrl:
                  "https://static.onecms.io/wp-content/uploads/sites/14/2020/07/15/fashion-header-1-2000.jpg"),
          CategorySection(
              categoryName: "Local",
              imgUrl:
                  "https://www.mercurynews.com/wp-content/uploads/2018/04/sjm-l-oped-chase-0410-2.jpg?w=467")
        ],
      ),
    );
  }
}

class SectionII extends StatelessWidget {
  const SectionII({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6, left: 12, right: 12, bottom: 6),
      //color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Google's New free app teaches kids to\nread by listening to them",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              "https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2020/11/14/Pictures/_ded48fd4-25fd-11eb-8924-93a7f7a2e27c.jpg",
              height: 170,
              width: 350,
              fit: BoxFit.cover,
              //color: Colors.red,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            textAlign: TextAlign.justify,
            "Google has just ripped the beta label off Rivet, its free mobile app design to help young children learn to read.",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  const CategorySection(
      {Key? key, required this.categoryName, required this.imgUrl})
      : super(key: key);

  final String imgUrl;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, top: 3),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xffD8227A),
            child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.grey[100],
                backgroundImage: NetworkImage(imgUrl)),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            categoryName,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
