import 'package:flutter/material.dart';
import 'package:new_api/provider/provider_page.dart';
import 'package:new_api/register/login.dart';
import 'package:new_api/splash_screen/splash_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
      ChangeNotifierProvider(create: (context) =>ProviderApi() ,)
    ],child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ));
  }
}

