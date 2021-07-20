import 'package:boilerplate/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      home: SplashPage(),
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Color.fromRGBO(244, 233, 215, 1),
        accentColor: Color.fromRGBO(244, 233, 215, 1),
      ),
    ),
  );
}
