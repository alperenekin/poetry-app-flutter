import 'package:flutter/material.dart';
import 'package:poem_app/core/init/navigation/transitions/fade_route.dart';
import 'package:poem_app/core/init/navigation/transitions/size_route.dart';
import 'package:poem_app/view/author/view/author_view.dart';
import 'package:poem_app/view/poem/model/poem_model.dart';
import 'package:poem_app/view/poem/view/poem_view.dart';
import 'package:poem_app/view/poemdetail/view/poem_detail_view.dart';

import 'navigation_constants.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationConstants.AUTHOR_VIEW:
        return _navigateToFadeDefault(AuthorView(authorName: settings.arguments as String?), settings);
      case NavigationConstants.POEM_VIEW:
        return _navigateToSizeDefault(PoemView(), settings);
      case NavigationConstants.POEM_DETAIL:
        return _navigateToSizeDefault(PoemDetailView(poems: settings.arguments as List<PoemModel>), settings);
      default:
        return _normalNavigate(Scaffold(
          body: Text("Not Found"),
        ));
    }
  }

  MaterialPageRoute _normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }

  static PageRoute _navigateToFadeDefault(Widget page, RouteSettings settings) {
    return FadeRoute(page: page, settings: settings);
  }

  static PageRoute _navigateToSizeDefault(Widget page, RouteSettings settings) {
    return SizeRoute(page: page, settings: settings);
  }

}
