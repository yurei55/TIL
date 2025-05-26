// lib/screens/my_reviews_screen.dart
import 'package:flutter/material.dart';

class MyReviewsScreen extends StatelessWidget {
  const MyReviewsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('내 리뷰')),
      body: const Center(child: Text('내가 작성한 리뷰 리스트')),
    );
  }
}