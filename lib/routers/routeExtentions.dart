import 'package:flutter/material.dart';
import 'package:testweb1/routers/appRouteConfiguration.dart';
import 'package:testweb1/routers/appRouteDelegate.dart';

extension RouteExtension on BuildContext {
  Future<void> navigateTo(AppRouteConfiguration path) async {
    (Router.of(this).routerDelegate as AppRouterDelegate).push(path);
  }

  Future<bool> pop() async {
    return await (Router.of(this).routerDelegate as AppRouterDelegate)
        .popRoute();
  }

  Future<bool> popUntil(AppRouteConfiguration path) async {
    AppRouterDelegate deletgate =
        (Router.of(this).routerDelegate as AppRouterDelegate);
    while (
        deletgate.appRouteConfigurations.last.screenType != path.screenType!) {
      await this.pop();
    }

    return true;
  }
}
