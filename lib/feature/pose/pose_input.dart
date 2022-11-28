import 'package:shus_flutter/common/interface/flutter_image.dart';
import 'package:shus_flutter/common/interface/native_interface_base.dart';

class PoseInput implements NativeSendBase {
  double height;
  FlutterImageBase image;

  PoseInput({required this.height, required this.image});

  @override
  Map<String, dynamic> toData() {
    return {
      "height": height,
      "image": image.toData(),
    };
  }
}
