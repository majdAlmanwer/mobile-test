import 'package:dio/dio.dart';

class RegisterModel {
  bool? success;
  String? message;
  Data? data;

  RegisterModel({this.success, this.message, this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? countryCode;
  String? phone;
  String? email;
  String? token;
  String? tokenExpiry;

  Data(
      {this.id,
      this.name,
      this.countryCode,
      this.phone,
      this.email,
      this.token,
      this.tokenExpiry});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryCode = json['country_code'];
    phone = json['phone'];
    email = json['email'];
    token = json['token'];
    tokenExpiry = json['token_expiry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['token'] = this.token;
    data['token_expiry'] = this.tokenExpiry;
    return data;
  }

  // Map<String,dynamic> toRegister{
  //    Map<String, dynamic> data = {
  //     'name': name,
  //     'phone': phone,
  //     'countryCode': countryCode,
  //     'email': email,
  //     'password': password,
  //     'password_confirm': passwordconfirm,
  //   };
  //   return data;
  // }
}
