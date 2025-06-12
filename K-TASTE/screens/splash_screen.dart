// lib/screens/splash_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';
import 'main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 2초간 로고 띄우고 로그인 상태 확인
    Timer(const Duration(seconds: 2), _checkLogin);
  }

  void _checkLogin() {
    final user = FirebaseAuth.instance.currentUser;
    if (!mounted) return; //await 또는 Timer 이후 Navigator 쓴다면 if (!mounted) return; 은 무조건 넣자.

    Navigator.pushReplacement(
      context,
       MaterialPageRoute(
         builder: (_) => user == null ? const LoginScreen() : const MainPage(), //자동로그인 임시 비활성화 시 비활성
       ),
      // MaterialPageRoute(builder: (_) => const LoginScreen()), //자동로그인 임시 비활성 시 활성
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'K-Taste',
          style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
