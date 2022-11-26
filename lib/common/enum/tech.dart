enum Tech {
  methodChannel,
  mLKit,
  kotlin,
  swift;

  String get title {
    switch(this) {
      case Tech.methodChannel:
        return 'Method Channel';
      case Tech.mLKit:
        return 'ML Kit';
      case Tech.kotlin:
        return 'Kotlin';
      case Tech.swift:
        return 'Swift';
    }
  }
}
