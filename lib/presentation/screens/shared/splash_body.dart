
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magdsoft_flutter_structure/presentation/router/strings.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/login_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with SingleTickerProviderStateMixin{
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),() {
      Navigator.pushNamed(context, loginScreen);
    },);

    // animationController=AnimationController(vsync: this,duration: Duration(microseconds: 600));
    // fadingAnimation=Tween<double>(begin: 0.2,end: 1).animate(animationController!);
    // animationController?.repeat(reverse: true);
    // goToNextView();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Align(
            //   alignment:Alignment.center,
            //   child: Text(
            //     'Magd Soft',
            //     style: TextStyle(
            //       fontSize: 51,
            //       fontWeight: FontWeight.bold ,
            //       color: AppColor.light,
            //     ),
            //   ),
            // ),
            Image.asset('assets/images/logo.png'),

          ],
        ),
      ),
    );
  }
}

void goToNextView() {
  Future.delayed(Duration(seconds: 3),(){
    Get.to(()=>LoginScreen(),transition: Transition.fade);
  });

}
