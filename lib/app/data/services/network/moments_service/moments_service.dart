import 'package:iloilocityapp/app/data/services/network/moments_service/models/add_moment_response.dart';
import 'package:iloilocityapp/app/data/services/network/moments_service/models/moment_response.dart';
import 'package:image_picker/image_picker.dart';

abstract class MomentsService {
  Future<MomentsResponse> myMoments();
  Future<dynamic> momentDetails(String id);
  Future<AddMomentsResponse> addMoment(Map<String, dynamic> payload, XFile? attachment);
  Future<dynamic> downloadMoment(String id);
}
