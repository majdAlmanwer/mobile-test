import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:mobile_test_task/models/register_model.dart';
import 'package:mobile_test_task/view/auth/login/login_screen.dart';

import '../service/auth_service.dart';
import 'loader_controller.dart';
import 'messages_handler_controller.dart';

class RegisterController extends GetxController {
  final loaderController = Get.put(LoaderController());
  final msgHandler = Get.put(MessagesHandlerController());
  // var registerModel = RegisterModel();
  String token = '';
  String name = '';
  String countryCode = '';
  String phone = '';
  String email = '';
  String password = '';
  String passwordconfirm = '';

  Future<void> register(
    String name,
    String phone,
    String countryCode,
    String email,
    String password,
    String passwordconfirm,
  ) async {
    loaderController.isLoading(true);

    Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'country_code': countryCode,
      'password_confirm': passwordconfirm,
    };

    // var  formData = FormData.fromMap({});
    var formdata = dio.FormData.fromMap(data);
    // String message = registerModel.message!;
    try {
      var response = await AuthService().register(formdata);
      msgHandler.showSuccessMessage("${response.message}");
      // msgHandler.showSuccessMessage('Your informaiton is updated successfully');
      Get.off(LoginScreen());
    } catch (e) {
      print('ddddddddddddddddddddd${e}');
      loaderController.isLoading(false);
      msgHandler.showErrorMessage('registerModel.message');
    }
    loaderController.isLoading(false);
  }
}
