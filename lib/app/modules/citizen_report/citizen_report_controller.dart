import 'package:get/get.dart';
import 'package:iloilocityapp/app/data/services/network/citizen_report_service/citizen_report_response.dart';
import 'package:iloilocityapp/app/data/services/network/citizen_report_service/citizen_report_service.dart';
import 'package:iloilocityapp/app/data/services/network/citizen_report_service/citizen_report_type_response.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:image_picker/image_picker.dart';

class CitizenReportController extends GetxController {
  final CitizenReportService _service;
  //booleans
  var loadingReports = false.obs;
  var loadingReportTypes = false.obs;
  var isAddingReport = false.obs;
  var submitTapped = false.obs;

  //Lists
  List<CitizenReportModel> myReportListRepository = [];
  var myReportList = [].obs;
  var reportTypesList = [].obs;
  var incidentReportList = [].obs;
  var typeFilterList = <String>[].obs;
  var nameFilterList = [].obs;

  //object
  var attachImage = {}.obs;

  //Strings
  var selectedType = ''.obs;
  var title = ''.obs;
  var content = ''.obs;
  var selectedTypeFilter = ''.obs;
  var selectedNameFilter = ''.obs;

  CitizenReportController(this._service);

  Future<void> getMyReports() async {
    try {
      loadingReports.value = true;
      final response = await _service.myReports();
      if (response.status) {
        myReportList.value = myReportListRepository = response.data;
        incidentReportList.value = response.data
            .where((element) => element.type.toLowerCase() == 'crime')
            .toList();
      }
    } catch (e) {
      handleError(message: e.toString());
    } finally {
      loadingReports.value = false;
    }
  }

  Future<void> getReportTypes() async {
    try {
      loadingReportTypes.value = true;
      final response = await _service.types();
      if (response.status) {
        reportTypesList.value = response.data;
        typeFilterList.value = response.data.map((e) => e.title).toList();
      }
    } catch (e) {
      handleError(message: e.toString());
    } finally {
      loadingReportTypes.value = false;
    }
  }

  Future<void> addCitizenReport() async {
    try {
      isAddingReport.value = true;
      final data = <String, dynamic>{
        'type': selectedType.value,
        'content': content.value,
        'title': title.value,
      };

      XFile? imageFile;
      if (attachImage['data'] != null) {
        imageFile = attachImage['data'] as XFile;
      }

      final response = await _service.addReport(data, imageFile);
      if (response.status) {
        await getMyReports();
        Get.back();
        showSnackBar('Success', response.msg);
      }
    } catch (e) {
      handleError(message: 'Unable to submit report!');
    } finally {
      isAddingReport.value = false;
    }
  }

  Future<dynamic> setImage(XFile? image) async {
    attachImage.value = image == null ? {} : {'data': image};
  }

  void clearCreateViewState() {
    selectedType.value = '';
    title.value = '';
    content.value = '';
    attachImage.value = {};
  }

  void clearReportViewState() {
    selectedNameFilter.value = '';
    selectedTypeFilter.value = '';
    submitTapped.value = false;
  }

  void setType(String value) {
    selectedType.value = value;
  }

  void setTitle(String value) {
    title.value = value;
  }

  void setContent(String value) {
    content.value = value;
  }

  void setTypeFilter(String value) {
    selectedTypeFilter.value = value;
  }

  void setNameFilter(String value) {
    selectedNameFilter.value = value;
  }

  void setSubmitTap() {
    submitTapped.value = true;
  }

  void filterReports() {
    if (selectedTypeFilter.value.isNotEmpty &&
        selectedNameFilter.value.isEmpty) {
      myReportList.value = myReportListRepository
          .where((element) => element.type
              .toLowerCase()
              .contains(selectedTypeFilter.toLowerCase()))
          .toList();
    }
    Get.back();
  }
}
