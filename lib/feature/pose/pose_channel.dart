import 'package:shus_flutter/common/interface/native_channel.dart';
import 'package:shus_flutter/feature/pose/pose_input.dart';
import 'package:shus_flutter/feature/pose/pose_result.dart';

class PoseChannel extends NativeChannel {
  Future<PoseResult> poseDetect(PoseInput input) async {
    final result = await channel.invokeMethod("pose-fn", input.toData());
    final mapData = Map<String, dynamic>.from(result);
    return PoseResult.fromData(mapData);
  }
}
