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
            final img = _data[index].imgUrl;
            final title = _data[index].title;
            final content = _data[index].description;
            final time = _data[index].pubTime;
            final DateTime pubTime = DateTime.parse(time ?? "");
            return Container(
              //color: Colors.blue,
              margin: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
              height: 100,
              width: double.infinity,
              child: Row(
                children: [
                  Image.network(
                    img ??
                        "https://hhpl.com.np/assets/images/imagenotfound.png",
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
                              SizedBox(
                                height: 38,
                                child: Text(
                                  title ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(content.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  maxLines: 2,
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
                            Text("${pubTime.second} hrs ago",
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
