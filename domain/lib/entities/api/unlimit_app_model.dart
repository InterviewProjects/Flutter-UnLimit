class UnLimitAppResponse<T> {
  T? data;
  UnLimitAppError? error;

  UnLimitAppResponse({
    this.data,
    this.error,
  });

  bool get isSuccess => data != null;
}

class UnLimitAppError {
  dynamic error;

  UnLimitAppError({this.error});

  String? get msg => error.toString();
}
