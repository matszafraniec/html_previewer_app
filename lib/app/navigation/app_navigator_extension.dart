import 'package:flutter/material.dart';
import 'package:html_previewer_app/app/navigation/app_navigator.dart';
import 'package:provider/provider.dart';

extension AppNavigatorExtension on BuildContext {
  AppNavigator get appNavigator => read<AppNavigator>();
}
