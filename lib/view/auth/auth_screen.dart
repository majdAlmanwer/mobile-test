import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_test_task/view/auth/login/login_screen.dart';
import 'package:mobile_test_task/view/auth/register/register_screen.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Image.asset(
                      'assets/images/ali_fouad_logo.png',
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.25,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Welcome to the app',
                      style: TextStyle(fontFamily: 'bold', fontSize: 25),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Get.to(LoginScreen());
                    },
                    child: Text(
                      'Login',
                      style:
                          TextStyle(fontFamily: 'ltalic', color: Colors.white),
                    ),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                        fixedSize: MaterialStateProperty.all(Size(
                            MediaQuery.of(context).size.width * 0.5,
                            MediaQuery.of(context).size.height * 0.07)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purple[900])),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(RegisterScreen());
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontFamily: 'ltalic', color: Colors.purple[900]),
                    ),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                        fixedSize: MaterialStateProperty.all(Size(
                            MediaQuery.of(context).size.width * 0.5,
                            MediaQuery.of(context).size.height * 0.07)),
                        side: MaterialStateProperty.all(
                            BorderSide(color: Colors.purple.shade900)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                  )
                ],
              ),
            ),
            Container(
              child: Text(
                'Designed & Developed by ',
                style: TextStyle(fontFamily: 'ltalic'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
