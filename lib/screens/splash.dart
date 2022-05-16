import 'package:flutter/material.dart';

import '../animations/entrance_fader.dart';
import '../configs/app.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_typography.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void _nextScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/global_data');
    });
  }

  @override
  void initState() {
    _nextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return const Scaffold(
      body: Center(
        child: EntranceFader(
          duration: Duration(seconds: 2),
          offset: Offset(0, 10),
          child: Image(
            image: AssetImage('lib/assets/splash.png'),
          ),
        ),
      ),
    );
  }
}
