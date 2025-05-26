// lib/screens/bookmark_screen.dart
import 'package:flutter/material.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('북마크')),
      body: const Center(child: Text('저장한 식당·리뷰 목록')),
    );
  }
}