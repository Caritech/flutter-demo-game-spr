import 'package:boilerplate/controllers/controller.dart';
import 'package:boilerplate/functions/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller()); // controller

    return Scaffold(
      appBar: AppBar(
        title: Text('Rock Paper Scissor'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              onChanged: controller.usernameChanged,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your username'),
            ),
            GetBuilder<Controller>(
              builder: (_) => Text('Entered: ${controller.username}'),
            ),
            ElevatedButton(
              onPressed: controller.login,
              child: Text('Ready for Battle'),
            )
          ],
        ),
      ),
    );
  }
}
