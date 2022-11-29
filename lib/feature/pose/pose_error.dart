import 'package:shus_flutter/feature/pose/pose_result.dart';

class PoseError implements PoseResult {
  int code;
  String message;

  PoseError(this.code, this.message);

  factory PoseError.fromData(Map<String, dynamic> args) {
    int code = args["code"];
    String message = args["message"];
    return PoseError(code, message);
  }
}