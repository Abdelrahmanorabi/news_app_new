import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/news_response.dart';
import 'model/sources_response.dart';

class ApiManager {
  static const String BASE_URL = 'newsapi.org';
  static const String API_KEY = 'b87494428a9840a0be4a47700f6a9de1';

  static Future<SourcesResponse> getNewsSources(String categoryId) async {
    Uri uri = Uri.https(BASE_URL, '/v2/top-headlines/sources',
        {'apiKey': API_KEY, 'category': categoryId}); // Request

    var response = await http.get(uri); // Response

    String responseBody = response
        .body; // Response body is a String ,,, so it must be converted to json to convert it to Dart Object
    Map<String, dynamic> json = jsonDecode(
        responseBody); // with jsonDecode convert responseBody (String) to  json (Map)

    SourcesResponse sourcesResponse =
        SourcesResponse.fromJson(json); // convert json to Dart object

    return sourcesResponse;
  }

  static Future<NewsResponse> getNewsBySourceId(
      {String? sourceId, String? query}) async {
    Uri uri = Uri.https(
      BASE_URL,
      'v2/everything',
      {
        'apiKey': API_KEY,
        'sources': sourceId,
        'q': query,
      },
    ); // Request

    var response = await http.get(uri); // Response
    String responseBody = response
        .body; // Response body is a String ,,, so it must be converted to json to convert it to Dart Object

    Map<String, dynamic> json = jsonDecode(
        responseBody); // with jsonDecode convert responseBody (String) to  json (Map)
    NewsResponse newsResponse =
        NewsResponse.fromJson(json); // convert json to Dart object

    return newsResponse;
  }
}
