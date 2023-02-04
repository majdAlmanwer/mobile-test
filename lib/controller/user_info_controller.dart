import 'package:get/get.dart';
import 'package:mobile_test_task/controller/loader_controller.dart';
import 'package:mobile_test_task/controller/login_controller.dart';
import 'package:mobile_test_task/models/user_info_model.dart';
import 'package:mobile_test_task/view/auth/home_page.dart';
import 'package:mobile_test_task/view/auth/login/login_screen.dart';
import 'package:dio/dio.dart' as dio;
import '../service/auth_service.dart';
import 'messages_handler_controller.dart';

class UserInfoController extends GetxController {
  final loginController = Get.put(LoginController());
  final loaderController = Get.put(LoaderController());
  final msgHandler = Get.put(MessagesHandlerController());

  String id = '';
  String name = '';
  String countryCode = '';
  String phone = '';
  String email = '';
  String token = '';
  String tokenExpiry = '';
  UserInfoModel? userInfo;
  Future<void> getUserInfo(String id) async {
    loaderController.isLoading(true);
    var userInfo = await AuthService().getUserInfo(id);
    name = userInfo.data.name;
    phone = userInfo.data.phone;
    email = userInfo.data.email;
    update();
    await loaderController.isLoading(false);
  }

  Future<void> deleteUser() async {
    loaderController.isLoading(true);
    // await userInfoController.checkTokenDate();
    var response = await AuthService().deleteUser();

    await loaderController.isLoading(false);
    msgHandler.showSuccessMessage("${response.message}");
    Get.to(LoginScreen());
    update();
  }

  Future<void> updateUser(
    String name,
    String phone,
    String countryCode,
    String email,
  ) async {
    loaderController.isLoading(true);

    Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'phone': phone,
      'country_code': countryCode,
    };

    var formdata = dio.FormData.fromMap(data);

    try {
      var response = await AuthService().update(formdata);
      msgHandler.showSuccessMessage("${response.message}");

      Get.off(HomePage());
    } catch (e) {
      loaderController.isLoading(false);
      msgHandler.showErrorMessage("");
    }
    loaderController.isLoading(false);
    update();
  }
}
