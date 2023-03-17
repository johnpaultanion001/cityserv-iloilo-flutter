import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:iloilocityapp/app/data/services/network/config/network_provider.dart';
import 'package:iloilocityapp/app/data/services/network/moments_service/models/add_moment_response.dart';
import 'package:iloilocityapp/app/data/services/network/moments_service/models/moment_response.dart';
import 'package:iloilocityapp/app/data/services/network/moments_service/moments_service.dart';
import 'package:image_picker/image_picker.dart';

class MomentsApi extends MomentsService {
  final NetworkProvider _apiProvider;
  MomentsApi(this._apiProvider);

  @override
  Future<AddMomentsResponse> addMoment(Map<String, dynamic> payload, XFile? image) async {
    if (image != null) {
      var attachment = await MultipartFile.fromFile(image.path);
      payload.addAll({'file': attachment});
    }

    final formData = FormData.fromMap(payload);

    String response = await _apiProvider.post(
      '/api/moment/create.json',
      body: formData,
    );
    Map<String, dynamic> data = jsonDecode(response);
    return AddMomentsResponse.fromJson(data);
  }

  @override
  Future<AddMomentsResponse> downloadMoment(String id) {
    // TODO: implement downloadMoment
    throw UnimplementedError();
  }

  @override
  Future<AddMomentsResponse> momentDetails(String id) {
    // TODO: implement momentDetails
    throw UnimplementedError();
  }

  @override
  Future<MomentsResponse> myMoments() async {
    String response = await _apiProvider.get(
      '/api/moment/my-moments.json?per_page=10',
    );
    Map<String, dynamic> data = jsonDecode(response);
    return MomentsResponse.fromJson(data);
  }
}
