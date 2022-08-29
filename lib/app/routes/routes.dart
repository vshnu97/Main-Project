import 'package:flutter/material.dart';

class RoutesScreen {
  pushScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (cxt) => screen));
  }

  popScreen(BuildContext context) {
    Navigator.of(context).pop();
  }
}
