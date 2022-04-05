import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/provider/search_provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key, required this.query}) : super(key: key);
  final String query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Search Page",
          style: TextStyle(),
        ),
        backgroundColor: Color(0xffD8227A),
      ),
      body: Consumer(builder: (context, ref, child) {
        final _data = ref.watch(searchProvider(query));
        return _data.when(
            data: (_searches) {
              return _searches.isEmpty
                  ? Center(
                      child: Text(
                        "No results found\nregarding news topic $query",
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView(
                      children: [
                        Text("Total News containing: $query"),
                        ..._searches.map((e) => ListTile(
                              title: Text(e.title ?? "abishek"),
                            ))
                      ],
                    );
            },
            error: (err, s) => Text(err.toString()),
            loading: () => Center(child: CircularProgressIndicator()));
      }),
    );
  }
}
