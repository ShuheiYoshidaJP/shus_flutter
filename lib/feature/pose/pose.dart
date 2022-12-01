import 'package:shus_flutter/feature/pose/pose_3d.dart';
import 'package:shus_flutter/feature/pose/pose_body_part_type.dart';

class Pose {
  PoseBodyPartType type;
  Pose3d point;
  Pose({required this.type, required this.point});
}
