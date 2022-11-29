import 'package:shus_flutter/common/interface/flutter_image.dart';
class PoseOutput {
  FlutterImageBase image;
  //TODO: Poseクラス入れる

  PoseOutput({required this.image});

  factory PoseOutput.fromData(Map<String, dynamic> args) {
    final imageArgs = Map<String, dynamic>.from(args["image"]);
    //TODO: add Pose
    return PoseOutput(image: FlutterByteImage.fromData(imageArgs));
  }
}
