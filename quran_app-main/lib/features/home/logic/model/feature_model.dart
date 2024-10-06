import 'package:flutter/material.dart';

class FeatureModel {
  final String itemImage;

  final String itemText;
  final Widget navigatorScreen;
  const FeatureModel({
    required this.itemImage,
    required this.itemText,
    required this.navigatorScreen,
  });
}
