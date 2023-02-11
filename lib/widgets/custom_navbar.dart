import 'package:covid_tracker/configs/app_dimensions.dart';
import 'package:covid_tracker/providers/theme_provider.dart';
import 'package:covid_tracker/screens/countries_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/dashboard.dart';
import '../screens/pakistan_data_screen.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: AppDimensions.normalize(30),
      child: Stack(
        children: [
          CustomPaint(
            size: Size(
              size.width,
              AppDimensions.normalize(30),
            ),
            painter: MyCustomPaint(),
          ),
          Center(
            heightFactor: 0.8,
            child: InkWell(
              hoverColor: Colors.transparent,
              onTap: () {
                themeProvider.theme = !themeProvider.theme;
              },
              child: Container(
                height: AppDimensions.normalize(20),
                width: AppDimensions.normalize(20),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  themeProvider.isDark
                      ? Icons.sunny
                      : Icons.mode_night_outlined,
                  color: Colors.yellow,
                  size: AppDimensions.normalize(15),
                ),
              ),
            ),
          ),
          SizedBox(
            height: AppDimensions.normalize(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.public,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const GlobalDataScreen()),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.flag,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const CountriesScreen()),
                      ),
                    );
                  },
                ),
                Container(
                  width: AppDimensions.normalize(30),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.star,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const PakistanData()),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.person,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * .20, 0, size.width * .35, 0);
    path.quadraticBezierTo(size.width * .40, 0, size.width * .40, 20);
    path.arcToPoint(Offset(size.width * .60, 20),
        radius: const Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width * .60, 0, size.width * .65, 0);
    path.quadraticBezierTo(size.width * .80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
