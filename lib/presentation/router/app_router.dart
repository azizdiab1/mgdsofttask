import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/router/strings.dart';

import '../screens/shared/splash_screen.dart';
import '../screens/user/login_screen.dart';
import '../screens/user/register_screen.dart';
import '../screens/user/user_profile.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) =>  LoginScreen());
      case loginScreen:
          return MaterialPageRoute(builder: (_) => LoginScreen());
      case registerScreen:
          return MaterialPageRoute(builder: (_)=>RegisterScreen());
      case userScreen:
        return MaterialPageRoute(builder: (_)=>UserScreen());
      default:
        return null;
    }
  }
}