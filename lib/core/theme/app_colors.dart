import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundDark = Color(0xFF090D16);
  static const Color surfaceDark = Color(0xFF131A29);
  static const Color cardBorder = Color(0xFF1E293B);

  static const Color gold = Color(0xFFFFD700);
  static const Color lPoints = Color(0xFFFF7B00);
  static const Color cyan = Color(0xFF00E5FF);
  static const Color green = Color(0xFF00FF66);

  static const LinearGradient draftGradient = LinearGradient(
    colors: [Color(0xFF2B0054), Color(0xFF0D1B48)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient fatalGradient = LinearGradient(
    colors: [Color(0xFF004D40), Color(0xFF001A24)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient packGradient = LinearGradient(
    colors: [Color(0xFF1A237E), Color(0xFF0D47A1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}