import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:tonjoo/utils/nullable_extension.dart';

import '../data/network/responses/common/common_error_response.dart';
import '../domain/models/common/common_error.dart';
import '../domain/models/common/common_error_type.dart';

Future<Either<CommonError, T>> callOrError<T>(
  Future<T> Function() block,
) async {
  try {
    return Right(await block());
  } on DioError catch (e) {
    switch (e.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return Left(CommonError(
          errorType: CommonErrorType.connectionTimeoutException,
          error: e,
          message: 'Connection Timeout',
        ));
      case DioErrorType.response:
        var statusCode = e.response?.statusCode ?? 0;

        switch (statusCode) {
          case 400:
            var message = '';
            var price = '';
            var date = '';
            try {
              var r = CommonErrorResponse.fromJson(e.response?.data);
              message = (r.errors?.message).orEmpty();
              price = (r.errors?.detailErrorMessage?.price).orEmpty();
              date = (r.errors?.detailErrorMessage?.date).orEmpty();
            } on Exception {
              message = 'Unknown Error';
            }

            return Left(CommonError(
              errorType: CommonErrorType.badRequestException,
              error: e,
              message: message,
              commonErrorData: CommonErrorData(price: price,date: date),
            ));
          case 401:
            return Left(CommonError(
              errorType: CommonErrorType.unauthorizedException,
              error: e,
              message: 'Unauthorized Exception',
              isShowErrorView: false,
            ));
          case 404:
            return Left(CommonError(
              errorType: CommonErrorType.notFoundException,
              error: e,
              message: 'URL Not Found',
            ));
          case 500:
            return Left(CommonError(
              errorType: CommonErrorType.internalServerException,
              error: e,
              message: 'Internal Server Error',
            ));
          default:
            return Left(CommonError(
              errorType: CommonErrorType.unknownException,
              error: e,
              message: 'Unknown Error',
            ));
        }
      case DioErrorType.cancel:
      case DioErrorType.other:
        return Left(CommonError(
          errorType: CommonErrorType.unknownException,
          error: e,
          message: e.message,
        ));
    }
  } on Exception catch (e) {
    return Left(CommonError(
      errorType: CommonErrorType.unknownException,
      error: e,
    ));
  } on ArgumentError catch (e) {
    return Left(CommonError(
      message: e.message,
      errorType: CommonErrorType.unknownException,
    ));
  } catch (e) {
    return Left(CommonError(
      message: 'Unknown Error $e',
      errorType: CommonErrorType.unknownException,
    ));
  }
}
