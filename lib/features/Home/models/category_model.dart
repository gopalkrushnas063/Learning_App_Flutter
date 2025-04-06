import 'dart:ui';

import 'package:flutter/material.dart';

class CategoryModel {
  final int id;
  final String catNames;
  final String catColors;
  final String catIcons;

  CategoryModel({
    required this.id,
    required this.catNames,
    required this.catColors,
    required this.catIcons,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      catNames: json['catNames'],
      catColors: json['catColors'],
      catIcons: json['catIcons'],
    );
  }

  Color get color {
    try {
      return Color(int.parse(catColors.replaceFirst('0x', '0xFF')));
    } catch (e) {
      return const Color(0xFFFFCF2F); // Default color
    }
  }

  IconData get icon {
    switch (catIcons) {
      case 'Icons.question_answer':
        return Icons.question_answer;
      case 'Icons.assignment':
        return Icons.assignment;
      case 'Icons.question_answer_outlined':
        return Icons.question_answer_outlined;
      case 'Icons.question_mark':
        return Icons.question_mark;
      case 'Icons.emoji_events':
        return Icons.emoji_events;
      default:
        return Icons.all_inbox;
    }
  }
}