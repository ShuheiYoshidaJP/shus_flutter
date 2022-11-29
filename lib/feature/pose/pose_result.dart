import 'package:shus_flutter/feature/pose/pose_error.dart';
import 'package:shus_flutter/feature/pose/pose_output.dart';

abstract class PoseResultBase {}

class PoseResult implements PoseResultBase {
  factory PoseResult.fromData(Map<String, dynamic> args) {
    bool isSuccess = args["result"];
    if (isSuccess) {
      return PoseOutput.fromData(args);
    } else {
      return PoseError.fromData(args);
    }
  }
}
