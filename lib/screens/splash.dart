import 'package:covid_tracker/configs/configs.dart';
import 'package:flutter/material.dart';
import '../configs/app.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void _nextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: AppDimensions.normalize(150),
              child: const Image(
                image: AssetImage('lib/assets/splash.png'),
              ),
            ),
            Space.yf(10),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
