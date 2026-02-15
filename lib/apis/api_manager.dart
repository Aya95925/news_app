import 'package:dio/dio.dart';
import 'package:news_app/models/article_response/article.dart';
import 'package:news_app/models/article_response/article_response.dart';
import 'package:news_app/models/source_response/source.dart';
import 'package:news_app/models/source_response/source_response.dart';

abstract final class ApiManager {
  static const String apiKey = '57f79e93f95542e8ae9d20202ed6d7a7';
  static const String baseUrl = 'https://newsapi.org';
  static const String sourceEndPoint = '/v2/top-headlines/sources';
  static const String articleEndPoint = '/v2/everything';
  static Future<List<Source>> loadSources() async {
    try {
      final dio = Dio();

      Response response = await dio.get(
        '$baseUrl$sourceEndPoint?apiKey=$apiKey',
      );

      print(
        'response.data: ${response.data} statusCode:${response.statusCode}',
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        Map<String, dynamic> json = response.data;
        SourceResponse sourceResponse = SourceResponse.fromJson(json);
        return sourceResponse.sources ?? [];
      } else {
        throw Exception('Server error: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('$e');
    }
  }

  static Future<List<Article>> loadArticle(String sourceId) async {
    try {
      final dio = Dio();
      Response response = await dio.get(
        '$baseUrl$articleEndPoint?apiKey=$apiKey&sources=$sourceId',
      );
       print(
        'response.data: ${response.data} statusCode:${response.statusCode}',
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        Map<String, dynamic> json = response.data;
        ArticleResponse articleResponse = ArticleResponse.fromJson(json);
        return articleResponse.articles??[];
      }else {
        throw Exception('Server error: ${response.statusMessage}');
      }
    } on Exception catch (e) {
      print('Error: $e');
      throw Exception('$e');
    }
  }
}
