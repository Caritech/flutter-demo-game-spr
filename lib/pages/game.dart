import 'dart:convert';

import 'package:boilerplate/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../functions/global.dart';

class GamePage extends StatelessWidget {
  bool usrWon = false;
  bool optWon = false;
  bool draw = false;
  int o2;
  int u1;

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller()); // controller

    return Scaffold(
        appBar: AppBar(title: Text('Game')),
        body: GetBuilder<Controller>(builder: (_) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _result(enemy: true),
                _result(),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Text(
                    controller.gameResult,
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
                controller.gameOwnInput == ''
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _userInput('stn'),
                          _userInput('scr'),
                          _userInput('ppr'),
                        ],
                      )
                    : ElevatedButton(
                        onPressed: controller.nextGame,
                        child: Text('Next Game'),
                      ),
                Text(json.encode(controller.gameCount))
              ],
            ),
          );
        }));
  }

  //link to _columnList
  Widget _result({enemy = false}) {
    Color color =
        enemy ? Color.fromRGBO(198, 51, 51, 1) : Color.fromRGBO(0, 122, 255, 1);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: enemy
          ? _columnList(enemy, color).reversed.toList()
          : _columnList(enemy, color),
    );
  }

  List<Widget> _columnList(enemy, color) {
    Controller controller = Get.put(Controller()); // controller
    var gameInput;

    return [
      Container(margin: EdgeInsets.only(left: 40)),
      Container(
        margin: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0),
        width: 120.0,
        height: 120.0,
        child: GetBuilder<Controller>(
          builder: (_) {
            if (enemy) {
              gameInput = controller.getGameEnemyInput();
            } else {
              gameInput = controller.getGameOwnInput();
            }
            return _displayImage(gameInput);
          },
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: color, width: 3.0),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      Text(
        enemy ? controller.getEnemyName() : controller.getOwnName(),
        textAlign: TextAlign.center,
        style:
            TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.bold),
      )
    ];
  }

  //img = stn, ppr, scr
  Widget _displayImage(String img) {
    String imgPath = getGameImage(img);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Image.asset(
          imgPath,
        ),
      ),
    );
  }

  _userInput(String index) {
    Controller controller = Get.put(Controller()); // controller
    return Container(
      margin: EdgeInsets.fromLTRB(15, 45, 15, 30),
      width: 90.0,
      height: 120.0,
      child: Card(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset("assets/${images[index]}.png"),
            ),
            onTap: () {
              controller.setGameOwnInput(index);
            },
          )),
    );
  }
}
