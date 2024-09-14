// ignore_for_file: must_be_immutable
import 'package:e_commerce/ui/utils/my_routes.dart';
import 'package:e_commerce/ui/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ECommerceApp extends StatelessWidget {
  String? appRoute;

  ECommerceApp({required this.appRoute, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.myTheme,
        initialRoute: appRoute,
        routes: MyRoutes.myRoutes,
      ),
    );
  }
}
