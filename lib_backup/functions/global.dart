import 'package:flutter/material.dart';
import 'dart:math';

import 'package:get/get.dart';

Map<String, String> images = {'stn': 'stn', 'ppr': 'ppr', 'scr': 'scr'};

Color themeColor = Color.fromRGBO(244, 233, 215, 1);

//required Getx
void alert(String text) {
  Get.defaultDialog(
      title: 'Alert',
      content: Column(
        children: [
          Text(text),
          ElevatedButton(onPressed: Get.back, child: Text('Close'))
        ],
      ));
}

String getGameImage(String img) {
  if (img == 'scr') {
    return 'assets/scr.png';
  } else if (img == 'ppr') {
    return 'assets/ppr.png';
  } else if (img == 'stn') {
    return 'assets/stn.png';
  } else if (img == 'own_thinking') {
    return 'assets/own_thinking.gif';
  } else if (img == 'enemy_thinking') {
    return 'assets/enemy_thinking.gif';
  } else {
    return 'assets/scr.png';
  }
}

randomGameInput() {
  var map = images;
  final _random = new Random();
  var values = map.values.toList();
  var element = values[_random.nextInt(values.length)];
  return element;
}
