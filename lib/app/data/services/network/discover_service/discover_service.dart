import 'package:iloilocityapp/app/data/services/network/discover_service/models/directory_response.dart';
import 'package:iloilocityapp/app/data/services/network/discover_service/models/establishments_response.dart';

abstract class DiscoverService {
  Future<DirectoryResponse> directories();
  Future<EstablishmentsResponse> establishments();
}
