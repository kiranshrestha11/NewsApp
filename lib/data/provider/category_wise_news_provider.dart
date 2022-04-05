import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/model/top_headline_model.dart';
import 'package:news_app/data/repository.dart';

final categoryWiseNewsProvider =
    FutureProvider.family<List<TopHeadlineModel>, String>(
        (ref, category) async {
  return ref.watch(repositoryProvider).getCategoryWiseNews(category: category);
});
