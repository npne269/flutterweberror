import 'package:testweb1/pages/aboutPage.dart';
import 'package:testweb1/pages/homePage.dart';

class AppRouteConfiguration {
  final Type? screenType;
  final bool isUnknown;

  AppRouteConfiguration.home()
      : screenType = HomePage,
        isUnknown = false;

  AppRouteConfiguration.unknown()
      : screenType = null,
        isUnknown = true;

  AppRouteConfiguration.about()
      : screenType = AboutPage,
        isUnknown = false;
}
