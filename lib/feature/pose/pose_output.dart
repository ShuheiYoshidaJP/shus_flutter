import 'package:shus_flutter/common/interface/flutter_image.dart';
import 'package:shus_flutter/feature/pose/pose_result.dart';

class PoseOutput implements PoseResult {
  FlutterImageBase image;
  //TODO: Poseクラス入れる

  PoseOutput(this.image);

  factory PoseOutput.fromData(Map<String, dynamic> args) {
    final imageArgs = Map<String, dynamic>.from(args["image"]);
    //TODO: add Pose
    FlutterByteImage image = FlutterByteImage.fromData(imageArgs);
    return PoseOutput(image);
  }
}
