import 'package:flutter/material.dart';
import 'package:shus_flutter/common/abstracts/result.dart';

/// A failure, storing a [Failure] value.
@immutable
class Failure<S, F> extends Result<S, F> {
  final F value;

  Failure(this.value);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Failure<S, F> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Failure: $value';
}
