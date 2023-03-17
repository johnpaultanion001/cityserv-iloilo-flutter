import 'dart:convert';

import 'package:iloilocityapp/app/data/services/network/common/base_response.dart';
import 'package:iloilocityapp/app/data/services/network/moments_service/models/moment_model.dart';

MomentsResponse momentsResponseFromJson(String str) => MomentsResponse.fromJson(json.decode(str));

String momentsResponseToJson(MomentsResponse data) => json.encode(data.toJson());

class MomentsResponse extends BaseResponse<List<MomentModel>> {
  MomentsResponse({
    required this.hasMorepage,
    super.msg,
    super.status,
    super.statusCode,
    super.data,
  });

  final bool hasMorepage;

  factory MomentsResponse.fromJson(Map<String, dynamic> json) => MomentsResponse(
        msg: json["msg"],
        status: json["status"],
        statusCode: json["status_code"],
        data: List<MomentModel>.from(json["data"].map((x) => MomentModel.fromJson(x))),
        hasMorepage: json["has_morepage"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
        "status_code": statusCode,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "has_morepage": hasMorepage,
      };
}
