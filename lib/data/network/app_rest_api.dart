import 'package:dio/dio.dart';
import 'package:tonjoo/data/network/services/example_service.dart';

import '../../utils/date_time_helper.dart';

class AppRestApi {

  ExampleService getExampleService() {
    var option = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      connectTimeout: DateTimeHelper.fifteenSeconds,
      sendTimeout: DateTimeHelper.fifteenSeconds,
      receiveTimeout: DateTimeHelper.fifteenSeconds,
    );

    var exampleDio = Dio(option);

    return ExampleService(exampleDio);
  }
}
