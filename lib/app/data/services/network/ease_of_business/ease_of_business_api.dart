import 'dart:convert';

import 'package:iloilocityapp/app/data/services/network/config/network_provider.dart';
import 'package:iloilocityapp/app/data/services/network/ease_of_business/ease_of_business_service.dart';
import 'package:iloilocityapp/app/data/services/network/ease_of_business/models/ease_of_business_response.dart';

class EaseOfBusinessApi extends EaseOfBusinessService {
  final NetworkProvider _apiProvider;

  EaseOfBusinessApi(this._apiProvider);

  @override
  Future<EaseOfBusinessResponse> allBusiness() async {
    String response = await _apiProvider.get(
      '/api/doing-business/all.json?per_page=10',
    );
    Map<String, dynamic> data = jsonDecode(response);
    return EaseOfBusinessResponse.fromJson(data);
  }

  @override
  Future businessDetails(String id) {
    // TODO: implement businessDetails
    throw UnimplementedError();
  }
}
