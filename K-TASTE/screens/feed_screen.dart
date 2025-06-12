// lib/screens/feed_screen.dart
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('피드')),
      body: const Center(child: Text('팔로우한 리뷰어 피드')),
    );
  }
}
