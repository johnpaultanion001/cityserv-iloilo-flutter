import 'package:get/get.dart';
import 'package:iloilocityapp/app/data/services/network/moments_service/models/moment_model.dart';
import 'package:iloilocityapp/app/data/services/network/moments_service/moments_service.dart';
import 'package:iloilocityapp/app/global/constants/app_strings.dart';
import 'package:iloilocityapp/app/global/navigation/app_navigation.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:image_picker/image_picker.dart';

class MomentsController extends GetxController {
  final MomentsService service;
  final AppNavigation navigation;
  var isLoadingMoments = false.obs;
  var isCreatingMoment = false.obs;
  var isDownloadingImage = false.obs;
  var momentsList = [].obs;
  var attachImage = {}.obs;
  var momentTitle = ''.obs;

  MomentsController(this.service, this.navigation);

  void init() {
    momentTitle.value = '';
    attachImage.value = {};
  }

  Future<void> getMomentsList() async {
    isLoadingMoments.value = true;
    try {
      final response = await service.myMoments();
      if (response.status) {
        momentsList.value = response.data!;
      }
    } on Exception catch (_) {
      handleError(message: 'Unable to get moments list.');
    }
    isLoadingMoments.value = false;
  }

  void navigateToDetails(MomentModel data) {
    navigation.navigateToNamed(mymomentsdetails, arguments: {'data': data});
  }

  Future<void> gotToAdMoment() async {
    navigation.navigateToNamed(addmoment);
  }

  Future<void> createMoment() async {
    if (attachImage['data'] == null) {
      navigation.showErrorMessage('Image is required');
    }

    try {
      isCreatingMoment.value = true;
      final data = <String, dynamic>{
        'content': momentTitle.value,
      };

      XFile? imageFile;
      if (attachImage['data'] != null) {
        imageFile = attachImage['data'] as XFile;
      }

      final response = await service.addMoment(data, imageFile);
      if (response.status) {
        await getMomentsList();
        Get.back();
        showSnackBar('Successful', response.msg);
      }
    } on Exception catch (_) {
      handleError(message: 'Failed to add moment.');
    } finally {
      isCreatingMoment.value = false;
    }
  }

  Future<void> filterMoment() async {
    navigation.showSnackBar(AppStrings.notYetImplemented);
  }

  Future<void> downloadMoment(String imageUrl) async {
    try {
      isDownloadingImage.value = true;
      var imageId = await ImageDownloader.downloadImage(imageUrl);
      if (imageId == null) {
        return;
      }

      var path = await ImageDownloader.findPath(imageId);
      showSnackBar('Successful', 'Image is saved to $path');
    } on Exception catch (_) {
      handleError(message: 'Failed to download image');
    } finally {
      isDownloadingImage.value = false;
    }
  }

  Future<dynamic> setImage(XFile? image) async {
    attachImage.value = image == null ? {} : {'data': image};
  }

  void setMomentTitle(String value) {
    momentTitle.value = value;
  }
}
