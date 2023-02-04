import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/models/register_model.dart';
import 'package:mobile_test_task/models/user_info_model.dart';

import '../api/api.dart';
import '../controller/loader_controller.dart';
import '../controller/messages_handler_controller.dart';

class AuthService {
  static AuthService? _instance;
  var dio = Dio();

  final LoaderController loaderController = Get.put(LoaderController());

  MessagesHandlerController messagesHandlerController =
      Get.put(MessagesHandlerController());

  factory AuthService() => _instance ??= AuthService._();

  AuthService._();

  Future<dynamic> login([dynamic data]) async {
    print('aaaaaa${data}');

    var response = await Api().dio.post(
          'login',
          data: data,
        );
    var loginResponse = RegisterModel.fromJson(response.data);
    print('hhhhahahahahahahah${response.data}');

    if (response.statusCode == 200) {
      return loginResponse;
    }
  }

  Future<dynamic> getUserInfo(String id) async {
    var response = await Api().dio.get('user/$id');
    print('useeeeeeeer${response.data}');
    return UserInfoModel.fromJson(response.data);
  }

  Future<dynamic> deleteUser() async {
    var response = await Api().dio.delete('user/delete');
    print('aooooooooooooooooooooooo${response}');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      print("delete fild");
    }
  }

  Future<dynamic> register([dynamic data]) async {
    print('ssssssssssss${data}');

    var response = await Api().dio.post('user/register', data: data);

    print('fffffffffffffffff${response.data}');
    return RegisterModel.fromJson(response.data);
  }

  Future<dynamic> update([dynamic data]) async {
    print('ssssssssssssooooooooooooooooooo${data}');

    var response = await Api().dio.post('user/update', data: data);

    print('fffffffffffffffffoooooooooooo${response.data}');
    return RegisterModel.fromJson(response.data);
  }
}
