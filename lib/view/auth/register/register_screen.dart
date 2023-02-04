import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/view/auth/login/login_screen.dart';
import 'package:mobile_test_task/view/auth/register/body.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: Image.asset(
                  'assets/images/ali_fouad_logo.png',
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
              ),
              Container(
                child: Text(
                  'Register',
                  style: TextStyle(fontFamily: 'bold', fontSize: 25),
                ),
              ),
              FormsBody(),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Already have an account?',
                      style: TextStyle(
                          fontFamily: 'bold', fontSize: 15, color: Colors.grey),
                    ),
                  ),
                  TextButton(
                    onPressed: (() {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => LoginScreen()));
                    }),
                    child: Text(
                      'Login',
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
