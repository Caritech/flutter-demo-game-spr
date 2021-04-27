# Flutter scissor-rock-paper

For Demostrate usage of GetX on handling state

## Getting Started

try this project

`git clone https://github.com/Caritech/flutter-demo-game-spr.git`


## Explanation  of Project

State Management Package: https://pub.dev/packages/get

In flutter, `main.dart` is the first loaded first

`lib/functions/global.dart` is used to store global function

`lib/controllers/controller.dart` is used to handle the state and logic of entire application

* in real world application state and logic management should separate to different files for ease in maintain.

### `pages` Directory is used to store all the pages.
- use `Get.to(YourPageName())` to move to other page.
- `pages/splash.dart` is a splashscreen, use as a smooth transition to app
- `pages/login.dart` a page required an user input, which will pass to `GamePage` through GetX
- `pages/game.dart` a page use to demonstrate the GetX state management



