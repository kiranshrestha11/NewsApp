import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/model/news_content_model.dart';
import 'package:news_app/data/repository.dart';

final searchProvider =
    FutureProvider.family<List<NewsContentModel>, String>((ref, query) async {
  return ref.watch(repositoryProvider).getSearchedNews(query: query);
});
