import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:testweb1/pages/aboutPage.dart';
import 'package:testweb1/pages/homePage.dart';
import 'package:testweb1/routers/appRouteConfiguration.dart';

class AppRouterDelegate extends RouterDelegate<AppRouteConfiguration>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<AppRouteConfiguration> {
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  List<AppRouteConfiguration> _appRouteConfigurations = [];
  List<AppRouteConfiguration> get appRouteConfigurations =>
      _appRouteConfigurations;

  bool _canPop = true;

  GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  bool get canPop {
    if (_canPop == false) return false;

    return _appRouteConfigurations.isNotEmpty;
  }

  set canPop(bool canPop) => _canPop = canPop;

  AppRouteConfiguration? get currentConfiguration =>
      appRouteConfigurations.isNotEmpty ? appRouteConfigurations.last : null;

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: _navigatorKey,
        pages: [
          if (appRouteConfigurations.isEmpty)
            PageBuilder(AppRouteConfiguration.home()).page,
          for (AppRouteConfiguration path in appRouteConfigurations)
            PageBuilder(path).page,
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          if (canPop) {
            pop();
          }
          return true;
        });
  }

  @override
  Future<void> setNewRoutePath(AppRouteConfiguration path) async {
    if (_canPop == false) return SynchronousFuture(null);
    if (path == currentConfiguration) return SynchronousFuture(null);
    _appRouteConfigurations =
        _setNewRouteHistory(_appRouteConfigurations, path);

    notifyListeners();
    return SynchronousFuture(null);
  }

  @override
  Future<bool> popRoute() {
    print('Pop Route');
    return super.popRoute();
  }

  List<AppRouteConfiguration> _setNewRouteHistory(
      List<AppRouteConfiguration> routes, AppRouteConfiguration newRoute) {
    List<AppRouteConfiguration> pathsHolder = [];
    pathsHolder.addAll(routes);

    //Check if new path exists in history.
    for (AppRouteConfiguration path in routes) {
      // If path exists, remove all paths on top.
      if (path.screenType == newRoute.screenType) {
        int index = routes.indexOf(path);
        int count = routes.length;
        for (var i = index; i < count - 1; i++) {
          pathsHolder.removeLast();
        }

        return pathsHolder;
      }
    }
    // print(routes);
    // print(newRoute.screenType);
    // if (newRoute.screenType != null) {
    pathsHolder.add(newRoute);
    // }
    // pathsHolder.forEach((element) {
    //   print('paths ${element.screenType}');
    // });
    return pathsHolder;
  }

  void push(AppRouteConfiguration path) {
    _appRouteConfigurations.add(path);
    notifyListeners();
  }

  void pop() {
    _appRouteConfigurations.removeLast();
    notifyListeners();
  }
}

class PageBuilder {
  final AppRouteConfiguration homeRoutePath;

  PageBuilder(this.homeRoutePath);
  Page getPage(AppRouteConfiguration path) {
    switch (path.screenType) {
      case HomePage:
        return MaterialPage(
          child: HomePage(),
        );
      case AboutPage:
        return MaterialPage(
          child: AboutPage(),
        );
      default:
        return MaterialPage(
          child: Scaffold(
            body: Center(
              child: Text('404 NOT FOUND'),
            ),
          ),
        );
    }
  }

  dynamic get page => getPage(homeRoutePath);
}
