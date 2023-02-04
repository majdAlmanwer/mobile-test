import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';
import '../../controller/user_info_controller.dart';
import '../../widget/custom_text_form.dart';

class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({Key? key}) : super(key: key);

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var codeController = TextEditingController();
  String? dropDownValue;

  final userInfoController = Get.put(UserInfoController());
  final loginController = Get.put(LoginController());

  @override
  void initState() {
    var id = loginController.id;
    userInfoController.getUserInfo(id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.purple[900],
        bottom: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.purple[900],
          title: Text(
            'Update Information',
            style: TextStyle(
                fontFamily: 'bold', fontSize: 25, color: Colors.white),
          ),
        ),
      ),
      body: GetBuilder<UserInfoController>(
        builder: (_) => Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    onChanged: (value) {
                      // setState(() {
                      nameController.text = value;
                      // });
                      print('${value}');
                    },
                    keyboardType: TextInputType.name,
                    controller: nameController.text.isNotEmpty
                        ? nameController
                        : TextEditingController(text: userInfoController.name),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        focusColor: Colors.grey,
                        // hintText: widget.text,
                        hintStyle: TextStyle(
                          fontFamily: 'bold',
                          fontSize: 18,
                        ),
                        // prefixIcon: widget.widget,
                        // suffixIcon: widget.icon,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2.0),
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    // onTap: () {

                    // },
                    onChanged: (value) {
                      // setState(() {
                      phoneController.text = value;
                      // });
                      print('${value}');
                    },
                    keyboardType: TextInputType.name,
                    controller: phoneController.text.isNotEmpty
                        ? phoneController
                        : TextEditingController(text: userInfoController.phone),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        focusColor: Colors.grey,
                        // hintText: widget.text,
                        hintStyle: TextStyle(
                          fontFamily: 'bold',
                          fontSize: 18,
                        ),
                        prefixIcon: DropdownButton<String>(
                          // focusNode: codeFoucsNode,
                          items: <String>['963', '962', '964', '967']
                              .map((String value) {
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
                        // suffixIcon: widget.icon,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2.0),
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    onChanged: (value) {
                      emailController.text = value;
                    },
                    keyboardType: TextInputType.name,
                    controller: emailController.text.isNotEmpty
                        ? emailController
                        : TextEditingController(text: userInfoController.email),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        focusColor: Colors.grey,
                        // hintText: widget.text,
                        hintStyle: TextStyle(
                          fontFamily: 'bold',
                          fontSize: 18,
                        ),
                        // prefixIcon: widget.widget,
                        // suffixIcon: widget.icon,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2.0),
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    _.updateUser(
                      userInfoController.name = nameController.text,
                      userInfoController.phone = phoneController.text,
                      userInfoController.countryCode = dropDownValue!,
                      userInfoController.email = emailController.text,
                    );
                  },
                  child: Text(
                    'Save',
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
        ),
      ),
    );
  }
}
