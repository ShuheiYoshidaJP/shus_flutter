import 'package:shus_flutter/common/abstracts/failure.dart';
import 'package:shus_flutter/common/abstracts/result.dart';
import 'package:shus_flutter/common/abstracts/success.dart';
import 'package:shus_flutter/common/interface/native_channel.dart';
import 'package:shus_flutter/feature/pose/result/pose_error.dart';
import 'package:shus_flutter/feature/pose/pose_input.dart';
import 'package:shus_flutter/feature/pose/result/pose_output.dart';

class PoseChannel extends NativeChannel {
  Future<Result<PoseOutput, PoseError>> poseDetect(PoseInput input) async {
    final result = await channel.invokeMethod("pose-fn", input.toData());
    final mapData = Map<String, dynamic>.from(result);
    bool isSuccess = mapData["result"];
    if (isSuccess) {
      return Success(PoseOutput.fromData(mapData));
    } else {
      return Failure(PoseError.fromData(mapData));
    }
  }
}
