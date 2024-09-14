// ignore_for_file: must_be_immutable

import 'package:e_commerce/data/api/api_constants.dart';
import 'package:e_commerce/e_commerce_app.dart';
import 'package:e_commerce/ui/screens/auth/login/login_screen.dart';
import 'package:e_commerce/ui/screens/home/home_screen.dart';
import 'package:e_commerce/ui/utils/my_shared_preferences.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPreferces.init();
  var userToken = MySharedPreferces.getData(key: ApiConstants.userToken);
  String appRoute;
  if (userToken == null) {
    appRoute = LoginScreen.routeName;
  } else {
    appRoute = HomeScreen.routeName;
  }
  runApp(ECommerceApp(appRoute: appRoute));
}
