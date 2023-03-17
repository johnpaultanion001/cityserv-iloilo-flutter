import 'package:get/get.dart';
import 'package:iloilocityapp/app/data/services/network/articles/article_response.dart';
import 'package:iloilocityapp/app/data/services/network/articles/article_service.dart';
import 'package:iloilocityapp/app/global/constants/app_strings.dart';
import 'package:iloilocityapp/app/global/navigation/app_navigation.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class NewsAndEventsController extends GetxController {
  final ArticleService service;
  final AppNavigation navigation;

  var isLoadingArticles = false.obs;
  var articleList = [].obs;

  NewsAndEventsController(this.service, this.navigation);

  Future<void> getArticleList() async {
    isLoadingArticles.value = true;
    try {
      final response = await service.allArticles();
      if (response.status) {
        articleList.value = response.data;
      }
    } on Exception catch (_) {
      handleError(message: 'Unable to get articles.');
    }
    isLoadingArticles.value = false;
  }

  void navigateToDetails(ArticleModel data) {
    navigation.navigateToNamed(newseventsdetails, arguments: {'data': data});
  }

  void filterArticles() {
    navigation.showSnackBar(AppStrings.notYetImplemented);
  }
}
