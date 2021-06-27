import 'package:flutter/material.dart';
import 'package:testweb1/configure_nonweb.dart';
import 'package:testweb1/routers/routers.dart';

void main() {
  configureApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Demo web',
      theme: ThemeData.dark(),
      routerDelegate: AppRouterDelegate(),
      routeInformationParser: AppRouteInfoParser(),
    );
  }
}
