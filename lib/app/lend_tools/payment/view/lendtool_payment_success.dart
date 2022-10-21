import 'package:flutter/material.dart';
import 'package:main_project/app/home/view/screen_home.dart';
import 'package:main_project/app/routes/routes.dart';

class ScreenLendToolPaidSuccess extends StatelessWidget {
  const ScreenLendToolPaidSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
actions: [IconButton(onPressed: (){
  Routes.pushremoveUntil(screen: const ScreenHome());

}, icon:const Icon (Icons.home))],

      ),
    );
    
  }
}