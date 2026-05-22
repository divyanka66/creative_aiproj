import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';
import '../../core/utils/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentIndex = 0;

  final List<String> splashImages = [
    AppImages.splashImage1,

    AppImages.splashImage2,

    AppImages.splashImage3,

    AppImages.splashImage4,
  ];

  @override
  void initState() {
    super.initState();

    startSplashSequence();
  }

  void startSplashSequence() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (currentIndex < splashImages.length - 1) {
        setState(() {
          currentIndex++;
        });
      } else {
        timer.cancel();
        Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,

      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),

        child: SizedBox(
          key: ValueKey(currentIndex),

          width: double.infinity,

          height: double.infinity,

          child: Image.asset(splashImages[currentIndex], fit: BoxFit.cover),
        ),
      ),
    );
  }
}
