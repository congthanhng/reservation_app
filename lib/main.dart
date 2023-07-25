import 'package:flutter/material.dart';
import 'package:reservation_app/routes/route_named.dart';
import 'package:reservation_app/routes/routes_management.dart';
import 'package:reservation_app/utils/storage_key_management.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool? isShownOnBoarding =
      prefs.getBool(StorageKeyManagement.isShownOnBoarding);

  runApp(MyApp(
    isShownOnBoarding: isShownOnBoarding,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isShownOnBoarding});

  final bool? isShownOnBoarding;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: isShownOnBoarding == true
          ? RouteNamed.homePage
          : RouteNamed.onBoardingPage,
      onGenerateRoute: (settings) => RouteManager.routeManagement(settings),
    );
  }
}