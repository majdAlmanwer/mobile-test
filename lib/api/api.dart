import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:mobile_test_task/controller/login_controller.dart';
import 'package:mobile_test_task/controller/register_controller.dart';
import 'package:mobile_test_task/models/register_model.dart';
import 'package:mobile_test_task/resources/app_config.dart';

import '../controller/loader_controller.dart';
import '../controller/messages_handler_controller.dart';

class Api {
  // final AppConfigController appConfigUrl = Get.put(AppConfigController());
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: appConfig));

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },

      baseUrl: appConfig,
      receiveTimeout: 60000, // 15 seconds
      connectTimeout: 60000,
      sendTimeout: 60000,
    ));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;
  final LoaderController loaderController = Get.find();
  final MessagesHandlerController msgHandlerController =
      Get.put(MessagesHandlerController());
  final LoginController loginController = Get.put(LoginController());

  AppInterceptors(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = loginController.token;
    print('majjjjjjjjjd${token}');
    // options.method != 'POST' ? loaderController.isLoading(true) : null;
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  // @override
  // void onRequest(
  //     RequestOptions options, RequestInterceptorHandler handler) async {
  //   // options.method != 'GET' ? loaderController.isLoading(true) : null;

  //   return handler.next(options);
  // }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => Data: ${response.data}',
    );

    loaderController.isLoading(false);

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.response}',
    );
    // var error = RegisterModel.fromJson(err.response.statusCode).message.toString();
    // print(error);

    msgHandlerController.showErrorMessage(err.message);

    loaderController.isLoading(false);
    return super.onError(err, handler);
  }
}
