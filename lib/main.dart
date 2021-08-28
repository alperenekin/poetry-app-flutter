import 'package:flutter/material.dart';
import 'package:poem_app/core/init/theme/app_theme.dart';
import 'package:poem_app/view/poem/view/poem_view.dart';

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
      home: PoemView(),
    );
  }
}