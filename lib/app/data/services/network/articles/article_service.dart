import 'package:iloilocityapp/app/data/services/network/articles/article_response.dart';

abstract class ArticleService {
  Future<ArticleResponse> allArticles();
  Future<ArticleResponse> recentArticles();
  Future<ArticleResponse> articleDetails(ArticleModel data);
}
