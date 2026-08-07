import 'package:flutter/material.dart';

class Pack {
  final String id;
  final String name;
  final int price;
  final int minRating;
  final Color primaryColor;
  final Color secondaryColor;

  Pack({
    required this.id,
    required this.name,
    required this.price,
    required this.minRating,
    required this.primaryColor,
    required this.secondaryColor,
  });
}

final List<Pack> availablePacks = [
  Pack(
    id: 'gold_pack',
    name: 'GOLD PACK',
    price: 5000,
    minRating: 75,
    primaryColor: const Color(0xFFFFD700),
    secondaryColor: const Color(0xFFB8860B),
  ),
  Pack(
    id: 'special_pack',
    name: 'SPECIAL PACK 85+',
    price: 25000,
    minRating: 85,
    primaryColor: const Color(0xFF00E5FF),
    secondaryColor: const Color(0xFF0055FF),
  ),
  Pack(
    id: 'ultimate_pack',
    name: 'ULTIMATE PACK 88+',
    price: 50000,
    minRating: 88,
    primaryColor: const Color(0xFFFF0055),
    secondaryColor: const Color(0xFF7A0099),
  ),
];