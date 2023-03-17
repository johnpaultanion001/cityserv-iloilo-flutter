import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:iloilocityapp/app/data/services/network/citizen_report_service/citizen_report_add_response.dart';
import 'package:iloilocityapp/app/data/services/network/citizen_report_service/citizen_report_response.dart';
import 'package:iloilocityapp/app/data/services/network/citizen_report_service/citizen_report_service.dart';
import 'package:iloilocityapp/app/data/services/network/citizen_report_service/citizen_report_type_response.dart';
import 'package:iloilocityapp/app/data/services/network/config/network_provider.dart';
import 'package:image_picker/image_picker.dart';

class CitizenReportAPI extends CitizenReportService {
  final NetworkProvider _apiProvider;
  CitizenReportAPI(this._apiProvider);

  @override
  Future<CitizenReportAddResponse> addReport(Map<String, dynamic> payload, XFile? image) async {
    if (image != null) {
      var attachment = await MultipartFile.fromFile(image.path);
      payload.addAll({'file': attachment});
    }

    final formData = FormData.fromMap(payload);

    String response = await _apiProvider.post(
      '/api/citizen-report/create.json',
      body: formData,
    );
    Map<String, dynamic> data = jsonDecode(response);
    return CitizenReportAddResponse.fromJson(data);
  }

  @override
  Future<CitizenReportResponse> myReports() async {
    String response = await _apiProvider.get(
      '/api/citizen-report/my-reports.json?per_page=10',
    );
    Map<String, dynamic> data = jsonDecode(response);
    return CitizenReportResponse.fromJson(data);
  }

  @override
  Future<CitizenReportResponse> filterReports() {
    // TODO: implement filterReports
    throw UnimplementedError();
  }

  @override
  Future<dynamic> reportDetails(String id) {
    // TODO: implement reportDetails
    throw UnimplementedError();
  }

  @override
  Future<CitizenReportTypeResponse> types() async {
    String response = await _apiProvider.get(
      '/api/citizen-report/type.json',
    );
    Map<String, dynamic> data = jsonDecode(response);
    return CitizenReportTypeResponse.fromJson(data);
  }
}
