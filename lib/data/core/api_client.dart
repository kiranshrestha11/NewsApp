import 'package:http/http.dart';
import 'package:news_app/data/core/config.dart';

class ApiClient {
  Future getData({String endpoint = ""}) async {
    final result = await get(Uri.parse(Config.baseUrl + endpoint));
    return result.body;
  }
}
