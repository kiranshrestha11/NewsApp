import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/core/api_client.dart';
import 'package:news_app/data/core/config.dart';
import 'package:news_app/data/model/news_content_model.dart';
import 'package:news_app/data/model/top_headline_model.dart';

final repositoryProvider = Provider<Repository>((ref) {
  return Repository();
});

class Repository {
  Future<List<NewsContentModel>> getNewsContent() async {
    final result = await ApiClient().getData(endpoint: Config.topHeadlinesApi);
    final List data = result['articles'];
    final List<NewsContentModel> _content =
        data.map((e) => NewsContentModel.fromJson(e)).toList();
    return _content;
  }

  Future<List<NewsContentModel>> getNewsList() async {
    final result = await ApiClient().getData(endpoint: Config.everythingApi);
    final List data = result['articles'];
    final List<NewsContentModel> _newList =
        data.map((e) => NewsContentModel.fromJson(e)).toList();
    return _newList;
  }

  Future<List<TopHeadlineModel>> getCategoryWiseNews(
      {required String category}) async {
    final result = await ApiClient().getData(
        endpoint:
            '${Config.categoryWiswNews}$category&apiKey=cc501d372ff14be6b481d3218f08de01');
    final List sources = result['sources'];
    final List<TopHeadlineModel> _catNews =
        sources.map((e) => TopHeadlineModel.fromJson(e)).toList();
    return _catNews;
  }

  Future<List<NewsContentModel>> getSearchedNews(
      {required String query}) async {
    final result = await ApiClient().getData(
        endpoint:
            "${Config.searchedNews}$query&pageSize=22&apiKey=cc501d372ff14be6b481d3218f08de01");
    final List data = result['articles'];
    final List<NewsContentModel> _searchedNews =
        data.map((e) => NewsContentModel.fromJson(e)).toList();
    return _searchedNews;
  }
}
