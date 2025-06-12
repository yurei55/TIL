// lib/screens/main_page.dart
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'feed_screen.dart';
import 'bookmark_screen.dart';
import 'my_reviews_screen.dart';
import 'support_screen.dart';
import 'package:k_taste/services/firestore_service.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final FirestoreService _firestoreService = FirestoreService();
  final _pages = const [
    HomeScreen(),
    FeedScreen(),
    BookmarkScreen(),
    MyReviewsScreen(),
    SupportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (i) => setState(() => _currentIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.rss_feed), label: '피드'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: '북마크'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '내 리뷰'),
          BottomNavigationBarItem(icon: Icon(Icons.support_agent), label: '고객센터'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _firestoreService.testWriteData(); // 짧게 누를 때만
        },
        child: const Icon(Icons.cloud),
      ),
    );
  }
}
