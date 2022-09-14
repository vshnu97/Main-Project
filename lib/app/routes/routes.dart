import 'package:flutter/material.dart';

// class RoutesScreen {
//   pushScreen(BuildContext context, Widget screen) {
//     Navigator.of(context).push(MaterialPageRoute(builder: (cxt) => screen));
//   }

//   popscreen(BuildContext context) {
//     Navigator.of(context).pop();
//   }
// }


class Routes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static push({required var screen}) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static pushreplace({required var screen}) {
    navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }
  static popscreen(){
    navigatorKey.currentState?.pop();
  }
}
