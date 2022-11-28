abstract class NativeSendBase {
  Map<String, dynamic> toData();
}

abstract class NativeReceiveBase {
  void fromData(Map<String, dynamic> data);
}
