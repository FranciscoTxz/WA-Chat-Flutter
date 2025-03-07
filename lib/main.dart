import 'package:flutter/material.dart';
import 'package:simple_menu/resources/themes/theme_data.dart';
import 'package:simple_menu/viewmodel/call_view_model.dart';
import 'package:simple_menu/viewmodel/channels_view_model.dart';
import 'package:simple_menu/viewmodel/status_card_view_model.dart';
import 'package:simple_menu/viewmodel/theme_provider.dart';
import 'package:simple_menu/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProviderViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => CallViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChannelsViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => StatusViewModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProviderViewModel>(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.isDarkMode ? darkTheme : lightTheme,
      routerConfig: appRouter,
    );
  }
}
