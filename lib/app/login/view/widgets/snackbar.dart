import 'package:flutter/material.dart';
import 'package:main_project/app/providers/providers.dart';

pop(String msg) {
  Size size =
      MediaQuery.of(Providers.rootScaffoldMessengerKey.currentState!.context)
          .size;
  Providers.rootScaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      duration: const Duration(milliseconds: 1500),
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color.fromARGB(255, 215, 6, 6),
      margin: EdgeInsets.only(bottom: size.height - 130, right: 20, left: 20),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          msg,
          style: const TextStyle(
              letterSpacing: 2, fontWeight: FontWeight.w500, fontSize: 16),
        ),
      )));
}
