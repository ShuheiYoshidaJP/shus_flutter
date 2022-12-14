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

abstract class FlutterImageBase<T> implements NativeSendBase {
  ImageFileType get imageFileType;
  T get value;
}

class FlutterFileImage implements FlutterImageBase {
  final String path;

  FlutterFileImage(this.path);

  @override
  ImageFileType get imageFileType => ImageFileType.file;

  @override
  String get value => path;

  @override
  Map<String, dynamic> toData() {
    return {
      "fileType": imageFileType.value,
      "path": path,
    };
  }
}

class FlutterByteImage implements FlutterImageBase {
  Uint8List bytes;

  FlutterByteImage(this.bytes);

  factory FlutterByteImage.fromData(Map<String, dynamic> args) {
    Uint8List bytesData = args["data"];
    return FlutterByteImage(bytesData);
  }

  @override
  ImageFileType get imageFileType => ImageFileType.bytes;

  @override
  Uint8List get value => bytes;

  @override
  Map<String, dynamic> toData() {
    return {
      "fileType": imageFileType.value,
      "content": bytes,
    };
  }
}
