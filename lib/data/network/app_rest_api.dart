import 'package:dio/dio.dart';
import 'package:tonjoo/data/network/services/tonjoo_service.dart';

import '../../utils/date_time_helper.dart';

class AppRestApi {

  TonjooService getExampleService() {
    var option = BaseOptions(
      baseUrl: 'https://test-android.tongkolspace.com',
      headers: {"Content-Type": "application/json"},
      connectTimeout: DateTimeHelper.fifteenSeconds,
      sendTimeout: DateTimeHelper.fifteenSeconds,
      receiveTimeout: DateTimeHelper.fifteenSeconds,
    );

    var tonjooDio = Dio(option);

    return TonjooService(tonjooDio);
  }
}
