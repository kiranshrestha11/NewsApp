import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/provider/category_wise_news_provider.dart';

class MyNextPage extends ConsumerWidget {
  const MyNextPage({Key? key, required this.categoryName}) : super(key: key);
  final String categoryName;

  @override
  Widget build(BuildContext context, ref) {
    final _catNewsList = ref.watch(categoryWiseNewsProvider(categoryName));
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            categoryName,
            style: TextStyle(),
          ),
          backgroundColor: Color(0xffD8227A),
        ),
        body: _catNewsList.when(
            data: (_data) {
              return ListView(
                children: [
                  ..._data.map((e) =>
                      ListTile(title: Text(e.name), subtitle: Text(e.category)))
                ],
              );
            },
            error: (err, s) => Center(
                  child: Text(err.toString()),
                ),
            loading: () => const Center(
                  child: Center(child: CircularProgressIndicator()),
                )));
  }
}
