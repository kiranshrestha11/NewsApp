import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/provider/content_provider.dart';

class SectionII extends ConsumerWidget {
  const SectionII({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _newsContent = ref.watch(contentProvider);
    return Container(
      padding: EdgeInsets.only(top: 10, left: 12, right: 12, bottom: 5),
      //color: Colors.blue,
      height: 230,
      child: _newsContent.when(
        data: (_data) {
          return ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ..._data.map(
                (e) => Container(
                  margin: EdgeInsets.only(right: 14),
                  height: 257,
                  width: 334,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomStart,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              e.imgUrl ??
                                  "https://hhpl.com.np/assets/images/imagenotfound.png",
                              height: 170,
                              width: 334,
                              fit: BoxFit.cover,
                              //color: Colors.red,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 3, left: 3.5),
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8))),
                            child: Text(
                              e.title ?? "Title",
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 28,
                        child: Text(
                          textAlign: TextAlign.justify,
                          e.description.toString() == ''
                              ? "Description not available for the above news."
                              : e.description ?? "",
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
        error: (err, s) => Center(
          child: Text(err.toString()),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
