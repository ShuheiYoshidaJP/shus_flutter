import 'failure.dart';
import 'success.dart';

abstract class Result<S, F> {
  bool get isFailure => this is Failure<S, F>;

  bool get isSuccess => this is Success<S, F>;

  F get failure {
    if (this is Failure<S, F>) {
      return (this as Failure<S, F>).value;
    }

    throw Exception(
      'Make sure that result [isFailure] before accessing [failure]',
    );
  }

  S get success {
    if (this is Success<S, F>) {
      return (this as Success<S, F>).value;
    }

    throw Exception(
      'Make sure that result [isSuccess] before accessing [success]',
    );
  }
}
