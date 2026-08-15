import 'package:flutter/material.dart';
import '../../core/widgets/top_bar.dart';
import '../profile/screens/profile_screen.dart';
import 'pages/page_1_packs.dart';
import 'pages/page_2_play.dart';
import 'pages/page_3_club.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090D16),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: const TopBarWidget(),
          ),

          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: const [
                Page1Packs(),
                Page2Play(),
                Page3Club(),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 12, top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 10 : 7,
                  height: _currentPage == index ? 10 : 7,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index ? Colors.white : Colors.white24,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}