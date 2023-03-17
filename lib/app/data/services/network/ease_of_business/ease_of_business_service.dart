import 'package:iloilocityapp/app/data/services/network/ease_of_business/models/ease_of_business_response.dart';

abstract class EaseOfBusinessService {
  Future<EaseOfBusinessResponse> allBusiness();
  Future<dynamic> businessDetails(String id);
}
