import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 2500), () => Get.off(LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        color: Color.fromRGBO(244, 233, 215, 1),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash.gif',
            ),
            Container(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                'Scissors Paper Stone',
                //style: splashText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
