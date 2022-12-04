import 'package:flutter/material.dart';
import 'package:shus_flutter/common/abstracts/result.dart';

/// A success, storing a [Success] value.
@immutable
class Success<S, F> extends Result<S, F> {
  final S value;

  Success(this.value);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Success<S, F> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Success: $value';
}
