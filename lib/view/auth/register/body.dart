import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/controller/register_controller.dart';
import 'package:mobile_test_task/widget/custom_text_form.dart';

class FormsBody extends StatefulWidget {
  FormsBody({Key? key}) : super(key: key);

  @override
  State<FormsBody> createState() => _FormsBodyState();
}

class _FormsBodyState extends State<FormsBody> {
  final registerController = Get.put(RegisterController());
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var codeController = TextEditingController();
  // final nameFoucsNode = FocusNode();
  // final phoneFoucsNode = FocusNode();
  // final emailFoucsNode = FocusNode();
  // final passwordFoucsNode = FocusNode();
  // final confirmPasswordFoucsNode = FocusNode();
  // final codeFoucsNode = FocusNode();
  // bool obscure = true;
  String? dropDownValue;

  @override
  void initState() {
    super.initState();
    registerController;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (_) => Container(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width * 0.8,
                child: CustomTextForm(
                  controller: nameController,
                  // focusNode: nameFoucsNode,
                  text: 'Full Name',
                  textInputType: TextInputType.name,
                )),
            Container(
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width * 0.8,
              child: CustomTextForm(
                controller: phoneController,
                // focusNode: phoneFoucsNode,
                text: '55994435',

                widget: DropdownButton<String>(
                  // focusNode: codeFoucsNode,
                  items:
                      <String>['963', '962', '964', '967'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  // focusNode: codeFoucsNode,
                  value: dropDownValue,

                  onChanged: (val) {
                    setState(() {
                      dropDownValue = val;
                    });
                  },
                ),

                // widget: const Icon(Icons.flag_circle, color: Colors.purple),
                textInputType: TextInputType.phone,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width * 0.8,
              child: CustomTextForm(
                controller: emailController,
                // focusNode: emailFoucsNode,
                text: 'Email Address',
                textInputType: TextInputType.emailAddress,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width * 0.8,
              child: CustomTextForm(
                controller: passwordController,
                // focusNode: passwordFoucsNode,
                text: 'Password',
                textInputType: TextInputType.visiblePassword,
                // obscure: obscure,
                icon: IconButton(
                    onPressed: () {
                      setState(() {
                        // obscure = !obscure;
                      });
                    },
                    icon: Icon(Icons.visibility)),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width * 0.8,
              child: CustomTextForm(
                controller: confirmPasswordController,
                // focusNode: confirmPasswordFoucsNode,
                text: 'Confirm Password',
                textInputType: TextInputType.visiblePassword,
                // obscure: obscure,
                icon: IconButton(
                    onPressed: () {
                      setState(() {
                        // obscure = !obscure;
                      });
                    },
                    icon: Icon(Icons.visibility)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                // FocusScope.of(context).requestFocus(FocusNode());
                // _.register({
                //   'name': nameController,
                //   'phone': phoneController,
                //   'country_Code': dropDownValue,
                //   'email': emailController,
                //   'password': passwordController,
                //   'password_confirm': confirmPasswordController,
                // });

                _.register(
                  registerController.name = nameController.text,
                  registerController.phone = phoneController.text,
                  registerController.countryCode = dropDownValue!,
                  registerController.email = emailController.text,
                  registerController.password = passwordController.text,
                  registerController.passwordconfirm =
                      confirmPasswordController.text,
                );
                print('succssssssssssssssssssssssss');
              },
              child: Text(
                'Register',
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
          ],
        ),
      ),
    );
  }
}
