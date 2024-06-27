import 'package:flutter/material.dart';
import 'package:play_at/services/auth_service.dart';
import 'package:play_at/ui/common/login_screen.dart';
import 'package:play_at/ui/common/main_screen.dart';
import 'package:play_at/ui/common/splash_screen.dart';

import 'package:provider/provider.dart';

void main() async {
  runApp(const SportsMatchApp());
}

class SportsMatchApp extends StatelessWidget {
  const SportsMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthService(),
      child: MaterialApp(
        title: '함께 즐겨라! Play At',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
    // return MaterialApp(
    //   title: '함께 즐겨라! Play At',
    //   theme: ThemeData(
    //     useMaterial3: true,
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    //   ),
    //   debugShowCheckedModeBanner: false,
    //   home: LoginScreen(),
    //   // home: MyHomePage(),
    // );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    if (authService.isAuthenticated) {
      return const MainScreen();
    } else {
      return const LoginScreen();
    }
  }
}