import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/model/login_model.dart';
import 'package:news_app/local/local_data_source.dart';

final userDataProvider = FutureProvider.autoDispose<LoginModel>((ref) async {
  return LocalDataSource().getProfile();
});
