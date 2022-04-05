import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/model/news_content_model.dart';
import 'package:news_app/data/repository.dart';

final contentProvider = FutureProvider<List<NewsContentModel>>((ref) async {
  return ref.watch(repositoryProvider).getNewsContent();
});
