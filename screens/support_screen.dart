
// lib/screens/support_screen.dart
import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('고객센터')),
      body: const Center(child: Text('고객지원 페이지 (추후 구현)')),
    );
  }
}