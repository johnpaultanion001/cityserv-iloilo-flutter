import 'dart:convert';

import 'package:iloilocityapp/app/data/services/network/config/network_provider.dart';
import 'package:iloilocityapp/app/data/services/network/discover_service/discover_service.dart';
import 'package:iloilocityapp/app/data/services/network/discover_service/discover_service.dart';
import 'package:iloilocityapp/app/data/services/network/discover_service/models/establishments_response.dart';
import 'package:iloilocityapp/app/data/services/network/discover_service/models/directory_response.dart';

class DiscoverApi extends DiscoverService {
  final NetworkProvider _apiProvider;
  DiscoverApi(this._apiProvider);
  @override
  Future<DirectoryResponse> directories() async {
    String response = await _apiProvider.get(
      '/api/directory/all.json?per_page=10',
    );
    Map<String, dynamic> data = jsonDecode(response);
    return DirectoryResponse.fromJson(data);
  }

  @override
  Future<EstablishmentsResponse> establishments() async {
    String response = await _apiProvider.get(
      '/api/establishment/all.json?per_page=10',
    );
    Map<String, dynamic> data = jsonDecode(response);
    return EstablishmentsResponse.fromJson(data);
  }
}
