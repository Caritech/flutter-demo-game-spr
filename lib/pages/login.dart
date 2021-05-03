import 'package:boilerplate/controllers/controller.dart';
import 'package:boilerplate/functions/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller()); // controller

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50),
        child: Text('This is Login Page'),
      ),
    );
  }
}
