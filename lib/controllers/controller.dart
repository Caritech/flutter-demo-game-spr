import 'package:boilerplate/pages/game.dart';
import 'package:get/get.dart';
import '../functions/global.dart';

class Controller extends GetxController {
  var username;
  var oppositeUsername; //get from firebase

  String gameOwnInput = '';
  String gameEnemyInput = '';

  String gameResult = '';

  Map<String, int> gameCount = {'win': 0, 'lose': 0, 'draw': 0};

  usernameChanged(u) {
    username = u;
    update();
  }

  login() {
    //TODO get firebase username
    if (username != '' && username != null) {
      Get.to(() => GamePage());
    } else {
      alert('Username is required');
    }
  }

  getGameResult() {
    //TODO get firebase data
  }

  String getEnemyName() {
    return "Enemy";
  }

  String getOwnName() {
    return username ?? 'UNDEFINED';
  }

  String getGameEnemyInput() {
    if (gameEnemyInput == null || gameEnemyInput == '') {
      return 'enemy_thinking';
    } else {
      return gameEnemyInput;
    }
  }

  String getGameOwnInput() {
    if (gameOwnInput == null || gameOwnInput == '') {
      return 'own_thinking';
    } else {
      return gameOwnInput;
    }
  }

  setGameOwnInput(String input) {
    gameOwnInput = input;
    gameEnemyInput = randomGameInput();
    checkGameResult();
    update();
  }

  checkGameResult() {
    String o = gameOwnInput; //own
    String e = gameEnemyInput; //enemy
    gameResult = '';
    if (e == 'stn' && o == 'scr') {
      gameResult = 'lose';
    }
    if (e == 'stn' && o == 'ppr') {
      gameResult = 'win';
    }
    if (e == 'stn' && o == 'stn') {
      gameResult = 'draw';
    }

    if (e == 'scr' && o == 'scr') {
      gameResult = 'draw';
    }
    if (e == 'scr' && o == 'ppr') {
      gameResult = 'lose';
    }
    if (e == 'scr' && o == 'stn') {
      gameResult = 'win';
    }

    if (e == 'ppr' && o == 'scr') {
      gameResult = 'win';
    }
    if (e == 'ppr' && o == 'ppr') {
      gameResult = 'draw';
    }
    if (e == 'ppr' && o == 'stn') {
      gameResult = 'lose';
    }

    gameCount[gameResult]++;

    return gameResult;
  }

  nextGame() {
    gameOwnInput = '';
    gameEnemyInput = '';
    gameResult = '';
    update();
  }
}
