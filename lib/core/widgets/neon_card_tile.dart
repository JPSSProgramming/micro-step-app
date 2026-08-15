import 'package:flutter/material.dart';

class NeonCardTile extends StatelessWidget {
  final String title;
  final Widget? topWidget;
  final VoidCallback onTap;
  final Gradient borderGradient;
  final Gradient bgGradient;
  final double height;

  const NeonCardTile({
    super.key,
    required this.title,
    this.topWidget,
    required this.onTap,
    this.borderGradient = const LinearGradient(
      colors: [Colors.cyanAccent, Colors.purpleAccent],
    ),
    this.bgGradient = const LinearGradient(
      colors: [Color(0xFF131A29), Color(0xFF0D131E)],
    ),
    this.height = 140,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        padding: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: borderGradient,
          boxShadow: [
            BoxShadow(
              color: borderGradient.colors.first.withOpacity(0.15),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: bgGradient,
          ),
          child: Stack(
            children: [
              if (topWidget != null)
                Positioned.fill(
                  bottom: 30,
                  child: Center(child: topWidget),
                ),

              Positioned(
                bottom: 8,
                left: 0,
                right: 0,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(color: Colors.black, blurRadius: 4),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}