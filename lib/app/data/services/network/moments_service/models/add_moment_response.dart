import 'package:iloilocityapp/app/data/services/network/common/base_response.dart';
import 'package:iloilocityapp/app/data/services/network/moments_service/models/moment_model.dart';

class AddMomentsResponse extends BaseResponse<MomentModel> {
  AddMomentsResponse({super.msg, super.status, super.statusCode, super.data});

  factory AddMomentsResponse.fromJson(Map<String, dynamic> json) => AddMomentsResponse(
        msg: json["msg"],
        status: json["status"],
        statusCode: json["status_code"],
        data: MomentModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
        "status_code": statusCode,
        "data": data?.toJson(),
      };
}
