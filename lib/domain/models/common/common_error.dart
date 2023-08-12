import 'common_error_type.dart';

class CommonError {
  CommonErrorType errorType;
  Exception? error;
  String? message;
  bool isShowErrorView;
  CommonErrorData? commonErrorData;
  CommonError({
    this.errorType = CommonErrorType.unknownException,
    this.error,
    this.message,
    this.isShowErrorView = true,
    this.commonErrorData ,
  });
}

class CommonErrorData{
  String price;
  String date;
  CommonErrorData({
    this.price="",
    this.date=""
});
}
