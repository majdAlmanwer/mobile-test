import 'package:get/get.dart';
import 'package:mobile_test_task/models/register_model.dart';
import 'package:mobile_test_task/models/user_info_model.dart';
import 'package:mobile_test_task/view/auth/home_page.dart';
import 'package:dio/dio.dart' as dio;

import '../service/auth_service.dart';
import 'loader_controller.dart';
import 'messages_handler_controller.dart';

class LoginController extends GetxController {
  final loaderController = Get.put(LoaderController());
  final msgHandler = Get.put(MessagesHandlerController());

  String token = '';
  String id = '';
  String email = '';
  String password = '';

  Future<void> login(
    String email,
    String password,
  ) async {
    loaderController.isLoading(true);

    Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };

    var formdatalogin = dio.FormData.fromMap(data);
    try {
      var res = await AuthService().login(formdatalogin);
      print('ressssssssssssssssssssssssss${id}');
      token = res.data.token;
      id = res.data.id;
      update();

      msgHandler.showSuccessMessage("${res.message}");

      Get.off(HomePage());
    } catch (e) {
      print('ddddddddddddddddddddd${e}');
      loaderController.isLoading(false);
      msgHandler.showErrorMessage('registerModel.message');
    }
    loaderController.isLoading(false);
  }
}
