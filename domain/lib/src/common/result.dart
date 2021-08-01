import 'package:domain/src/utils/network_exceptions.dart';

class Result<T> with SealedResult<T> {
  bool get isSuccessful => this is Success<T>;
}

class Success<T> extends Result<T> {
  T data;

  Success(this.data);
}

class Error<T> extends Result<T> {
  NetworkExceptions type;
  String error;

  Error(this.type, this.error);
}

abstract class SealedResult<T> {
  R? when<R>({R Function(T)? success, R Function(NetworkExceptions, String)? error}) {
    if (this is Success<T>) {
      return success?.call(((this as Success).data));
    }

    if (this is Error<T>) {
      return error?.call((this as Error<T>).type, (this as Error<T>).error);
    }

    throw new Exception(
        'If you got here, probably you forgot to regenerate the classes? Try running flutter packages pub run build_runner build');
  }
}
