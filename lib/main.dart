import 'package:artista/config/artista.dart';
import 'package:artista/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  // Link Flutter with Flutter engine
  WidgetsFlutterBinding.ensureInitialized();

  // Force the vertical screen
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  // Run the Flutter application
  runApp(
    MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppColors.lightTheme,
      darkTheme: AppColors.darkTheme,
      routerConfig: Routes.router,
    ),
  );
}
