import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/controller/login_controller.dart';
import 'package:mobile_test_task/controller/user_info_controller.dart';
import 'package:mobile_test_task/view/auth/login/login_screen.dart';
import 'package:mobile_test_task/view/auth/update_uesr_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple[900],
        bottom: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.purple[900],
          title: Text(
            'Home Page',
            style: TextStyle(
                fontFamily: 'bold', fontSize: 25, color: Colors.white),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            GetBuilder<UserInfoController>(
              builder: (_) => Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.person_outline_sharp,
                        color: Colors.purple[900],
                      ),
                      title: Text(
                        userInfoController.name,
                        style: TextStyle(
                            fontFamily: 'bold',
                            fontSize: 18,
                            color: Colors.grey),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.phone_android,
                        color: Colors.purple[900],
                      ),
                      title: Text(
                        userInfoController.phone,
                        style: TextStyle(
                            fontFamily: 'bold',
                            fontSize: 18,
                            color: Colors.grey),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.mail_outline,
                        color: Colors.purple[900],
                      ),
                      title: Text(
                        userInfoController.email,
                        style: TextStyle(
                            fontFamily: 'bold',
                            fontSize: 18,
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () {
                        Get.to(UpdateUserScreen());
                      },
                      child: ListTile(
                          contentPadding: EdgeInsets.all(5),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.purple[900],
                          ),
                          title: Text(
                            'Update Information',
                            style: TextStyle(
                                fontFamily: 'bold',
                                fontSize: 20,
                                color: Colors.purple[900]),
                          )),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () {},
                      child: ListTile(
                          contentPadding: EdgeInsets.all(5),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.purple[900],
                          ),
                          title: Text(
                            'Change Password',
                            style: TextStyle(
                                fontFamily: 'bold',
                                fontSize: 20,
                                color: Colors.purple[900]),
                          )),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () {
                        userInfoController.deleteUser();
                      },
                      child: ListTile(
                          contentPadding: EdgeInsets.all(5),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.purple[900],
                          ),
                          title: Text(
                            'Delete Account',
                            style: TextStyle(
                                fontFamily: 'bold',
                                fontSize: 20,
                                color: Colors.purple[900]),
                          )),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () {},
                      child: ListTile(
                          contentPadding: EdgeInsets.all(5),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.purple[900],
                          ),
                          title: Text(
                            'Logout',
                            style: TextStyle(
                                fontFamily: 'bold',
                                fontSize: 20,
                                color: Colors.purple[900]),
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
