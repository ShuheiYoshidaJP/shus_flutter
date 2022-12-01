import 'package:shus_flutter/common/interface/flutter_image.dart';
import 'package:shus_flutter/feature/pose/pose.dart';
import 'package:shus_flutter/feature/pose/pose_3d.dart';
import 'package:shus_flutter/feature/pose/pose_body_part_type.dart';

class PoseOutput {
  FlutterImageBase image;
  List<Pose> poseList;

  PoseOutput({required this.image, required this.poseList});

  factory PoseOutput.fromData(Map<String, dynamic> args) {
    final imageArgs = Map<String, dynamic>.from(args["image"]);
    final poseData = Map<String, dynamic>.from(args["pose"]);
    final poseArray = PoseBodyPartType.values.map((type) {
      var mapData = Map<String, dynamic>.from(poseData[type.responseKey]);
      var point = Pose3d.fromData(mapData);
      return Pose(type: type, point: point);
    }).toList();
    return PoseOutput(
      image: FlutterByteImage.fromData(imageArgs),
      poseList: poseArray,
    );
  }
}
