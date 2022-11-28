import 'package:shus_flutter/common/interface/native_channel.dart';
import 'package:shus_flutter/feature/pose/pose_input.dart';

class PoseChannel extends NativeChannel {
  Future<void> poseDetect(PoseInput input) async {
    final result = await channel.invokeMethod("pose-fn", input.toData());
    print(result);
  }
}
