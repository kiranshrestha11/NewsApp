import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/provider/news_list_provider.dart';
import 'package:news_app/views/home/news_detail_page.dart';

class SectionIII extends ConsumerWidget {
  const SectionIII({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _newsList = ref.watch(newsListProvider);
    return _newsList.when(
      data: (_data) {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _data.length,
          itemBuilder: (context, index) {
            final e = _data[index].imgUrl;
            return Container(
              //color: Colors.blue,
              margin: EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 10),
              height: 100,
              width: double.infinity,
              child: Row(
                children: [
                  Image.network(
                    e.toString(),
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
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xffAAACAD))),
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
          },
        );
      },
      error: (err, s) => Text(err.toString()),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
