import 'package:flutter/material.dart';
import 'package:poem_app/core/init/navigation/navigation_constants.dart';
import 'package:poem_app/core/init/navigation/navigation_route.dart';
import 'package:poem_app/core/init/theme/app_theme.dart';
import 'package:poem_app/view/poem/view/poem_view.dart';

import 'core/init/navigation/navigation_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.instance.theme,
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      initialRoute: NavigationConstants.POEM_VIEW,
      home: PoemView(),
    );
  }
}