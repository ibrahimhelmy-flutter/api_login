

import 'package:flutter/material.dart';
import 'package:shop_app/presentation/screens/home_layout.dart';
import 'package:shop_app/presentation/screens/login_screen.dart';

class AppRouter {
  static Route onGenerateRouting(RouteSettings settings) {
    switch (settings.name) {

      case LoginScreen.id:
        return MaterialPageRoute(builder: (context) => LoginScreen());
        case HomeLayout.id:
        return MaterialPageRoute(builder: (context) => HomeLayout());

      default:
        return MaterialPageRoute(builder: (context) =>
            Scaffold(appBar: AppBar(title: Text("UnKnown Route"),),));
    }
  }
}
