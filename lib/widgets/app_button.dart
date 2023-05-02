import 'package:covid_tracker/configs/app.dart';
import 'package:covid_tracker/configs/configs.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  const AppIconButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: AppDimensions.normalize(20),
        width: AppDimensions.normalize(90),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor ?? Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 4),
              blurRadius: 6,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: AppText.b1!.cl(
              Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
