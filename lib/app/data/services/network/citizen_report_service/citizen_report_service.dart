import 'package:iloilocityapp/app/data/services/network/citizen_report_service/citizen_report_add_response.dart';
import 'package:iloilocityapp/app/data/services/network/citizen_report_service/citizen_report_response.dart';
import 'package:iloilocityapp/app/data/services/network/citizen_report_service/citizen_report_type_response.dart';
import 'package:image_picker/image_picker.dart';

abstract class CitizenReportService {
  Future<CitizenReportResponse> myReports();
  Future<dynamic> reportDetails(String id);
  Future<CitizenReportResponse> filterReports();
  Future<CitizenReportAddResponse> addReport(Map<String, dynamic> payload, XFile? attachment);
  Future<CitizenReportTypeResponse> types();
}
