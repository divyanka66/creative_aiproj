import 'package:creative_p/screens/login/welcome_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/utils/app_routes.dart';
import 'core/utils/app_theme.dart';
import 'providers/auth_provider.dart';
import 'providers/home_provider.dart';
import 'screens/home/home_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: AppRoutes.splash,
        routes: {
          AppRoutes.splash: (_) => SplashScreen(),
          AppRoutes.onboarding: (_) => OnboardingScreen(),
          AppRoutes.welcomeAuthScreen: (_) => WelcomeAuthScreen(),
          AppRoutes.login: (_) => LoginScreen(),
          AppRoutes.home: (_) => HomeScreen(),
        },
      ),
    );
  }
}
