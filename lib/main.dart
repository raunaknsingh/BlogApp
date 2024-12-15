import 'package:blog_app/core/app_theme.dart';
import 'package:blog_app/features/auth/presentation/screens/signin_page.dart';
import 'package:blog_app/features/auth/presentation/screens/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: AppTheme.darkThemeMode,
      home: const SigninPage(),
    );
  }
}

