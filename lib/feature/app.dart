import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:rick_and_morty/feature/character/presentation/character_screen.dart';

final navigationKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigationKey,
      title: 'Flutter Demo',
      home: const CharacterScreen(),
    );
  }
}
