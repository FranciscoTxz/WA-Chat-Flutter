import 'package:flutter/material.dart';
import 'package:simple_menu/resources/themes/theme_data.dart';
import 'package:simple_menu/resources/themes/theme_provider.dart';
import 'package:simple_menu/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.isDarkMode ? darkTheme : lightTheme,
      routerConfig: appRouter,
    );
  }
}
