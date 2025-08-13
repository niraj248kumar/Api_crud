import 'dart:async';
import 'package:flutter/material.dart';
import 'package:new_api/provider/provider_page.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreen();

  }

  Future<void> splashScreen() async{
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<ProviderApi>(context,listen: false);
      provider.login_splash(context);
    },);
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.redAccent,
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Text('Splash Screen',style: TextStyle(fontSize: 45),)
            ],
          ),
        ),
      ),
    );
  }
}
