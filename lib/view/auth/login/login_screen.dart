import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/controller/login_controller.dart';
import 'package:mobile_test_task/controller/user_info_controller.dart';
import 'package:mobile_test_task/models/register_model.dart';
import 'package:mobile_test_task/view/auth/home_page.dart';
import 'package:mobile_test_task/view/auth/register/register_screen.dart';
import 'package:mobile_test_task/widget/custom_text_form.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginController = Get.put(LoginController());
  final userInfoController = Get.put(UserInfoController());
  String id = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GetBuilder<LoginController>(
          builder: (_) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.all(25),
                child: Image.asset(
                  'assets/images/ali_fouad_logo.png',
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
              ),
              Container(
                child: Text(
                  'Login',
                  style: TextStyle(fontFamily: 'bold', fontSize: 25),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width * 0.8,
                child: CustomTextForm(
                  // focusNode: emailFoucsNude,
                  controller: emailController,
                  text: 'Email Address',
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width * 0.8,
                child: CustomTextForm(
                  // focusNode: passwordFoucsNude,
                  controller: passwordController,
                  text: 'Password',
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  _.login(loginController.email = emailController.text,
                      loginController.password = passwordController.text);
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontFamily: 'bold', color: Colors.white, fontSize: 25),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                    fixedSize: MaterialStateProperty.all(Size(
                        MediaQuery.of(context).size.width * 0.75,
                        MediaQuery.of(context).size.height * 0.08)),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.purple[900])),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Dont have an account?',
                      style: TextStyle(
                          fontFamily: 'bold', fontSize: 15, color: Colors.grey),
                    ),
                  ),
                  TextButton(
                    onPressed: (() => Get.to(RegisterScreen())),
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontFamily: 'bold',
                          color: Colors.deepPurple[900],
                          fontSize: 15),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
