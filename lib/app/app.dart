import 'package:flutter/material.dart';
import 'package:html_previewer_app/app/navigation/app_navigator.dart';
import 'package:html_previewer_app/presentation/home/home_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<AppNavigator>(
      create: (context) => AppNavigatorImpl(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
