
class PoseError {
  int code;
  String message;

  PoseError({required this.code, required this.message});

  factory PoseError.fromData(Map<String, dynamic> args) {
    return PoseError(code: args["code"], message: args["message"]);
  }
}
