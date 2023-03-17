import 'dart:convert';

import 'package:iloilocityapp/app/data/services/network/articles/article_response.dart';
import 'package:iloilocityapp/app/data/services/network/articles/article_service.dart';
import 'package:iloilocityapp/app/data/services/network/config/network_provider.dart';

class ArticleApi extends ArticleService {
  final NetworkProvider _apiProvider;
  ArticleApi(this._apiProvider);
  @override
  Future<ArticleResponse> allArticles() async {
    String response = await _apiProvider.get(
      '/api/article/all.json?per_page=10',
    );
    Map<String, dynamic> data = jsonDecode(response);
    return ArticleResponse.fromJson(data);
  }

  @override
  Future<ArticleResponse> articleDetails(ArticleModel data) {
    // TODO: implement articleDetails
    throw UnimplementedError();
  }

  @override
  Future<ArticleResponse> recentArticles() {
    // TODO: implement recentArticles
    throw UnimplementedError();
  }
}
