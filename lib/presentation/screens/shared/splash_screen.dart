import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/splash_body.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColor.white ,
      body: SplashBody(),
    );
  }
}