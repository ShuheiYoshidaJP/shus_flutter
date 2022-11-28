import 'package:flutter/foundation.dart';
import 'package:shus_flutter/common/interface/native_interface_base.dart';

enum ImageFileType {
  file,
  bytes;

  String get value {
    switch (this) {
      case ImageFileType.file:
        return "file";
      case ImageFileType.bytes:
        return "bytes";
    }
  }
}

abstract class FlutterImageBase implements NativeSendBase {
  ImageFileType get imageFileType;
}

class FlutterFileImage implements FlutterImageBase {
  final String path;

  FlutterFileImage(this.path);

  @override
  ImageFileType get imageFileType => ImageFileType.file;

  @override
  Map<String, dynamic> toData() {
    return {
      "fileType": imageFileType.value,
      "path": path,
    };
  }
}

class FlutterByteImage implements FlutterImageBase {
  final Uint8List bytes;

  FlutterByteImage(this.bytes);

  @override
  ImageFileType get imageFileType => ImageFileType.bytes;

  @override
  Map<String, dynamic> toData() {
    return {
      "fileType": imageFileType.value,
      "content": bytes,
    };
  }
}
