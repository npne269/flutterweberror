import 'package:flutter/cupertino.dart';
import 'package:testweb1/pages/aboutPage.dart';
import 'package:testweb1/pages/homePage.dart';
import 'package:testweb1/routers/appRouteConfiguration.dart';

class AppRouteInfoParser extends RouteInformationParser<AppRouteConfiguration> {
  @override
  Future<AppRouteConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    if (routeInformation.location == null)
      return AppRouteConfiguration.unknown();

    final uri = Uri.parse(routeInformation.location!);
    print(uri.pathSegments.length);

    if (uri.pathSegments.length == 0) {
      return AppRouteConfiguration.home();
    }

    if (uri.pathSegments.length == 1) {
      final text = uri.pathSegments.first;
      if ('$text' == 'about') {
        return AppRouteConfiguration.about();
      }
    }
    print('unknown route');
    return AppRouteConfiguration.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(
      AppRouteConfiguration configuration) {
    if (configuration.screenType == null)
      return RouteInformation(location: '/kiddo');
    switch (configuration.screenType) {
      case HomePage:
        return RouteInformation(location: '/');
      case AboutPage:
        return RouteInformation(location: '/about');
      default:
        return RouteInformation(location: '/kiddo');
    }
  }
}
