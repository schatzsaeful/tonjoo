import '../domain/models/common/common_error.dart';

enum AsyncState {
  uninitialized,
  loading,
  error,
  success;
}

class Async<T> {
  final T? data;
  final CommonError? error;
  final AsyncState state;

  const Async(
    this.data,
    this.error,
    this.state,
  );

  factory Async.uninitialized() {
    return const Async(null, null, AsyncState.uninitialized);
  }

  factory Async.loading({T? oldData}) {
    return Async(oldData, null, AsyncState.loading);
  }

  factory Async.success(T? data) {
    return Async(data, null, AsyncState.success);
  }

  factory Async.error(CommonError error, {T? oldData}) {
    return Async(oldData, error, AsyncState.error);
  }
}
