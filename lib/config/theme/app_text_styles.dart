import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Defines text styles for the application
class AppTextStyles {
  static const String fontFamily = 'NotoSansSC';

  /// Headings
  static const TextStyle h1 = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      height: 1.2,
      fontFamily: fontFamily);

  static const TextStyle h2 = TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      height: 1.2,
      fontFamily: fontFamily);

  static const TextStyle h3 = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      height: 1.2,
      fontFamily: fontFamily);

  static const TextStyle h4 = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      height: 1.2,
      fontFamily: fontFamily);

  static const TextStyle h5 = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      height: 1.2,
      fontFamily: fontFamily);

  static const TextStyle h6 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      height: 1.2,
      fontFamily: fontFamily);

  /// Body text
  static const TextStyle bodyLarge = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimary,
      height: 1.5,
      fontFamily: fontFamily);

  static const TextStyle bodyMedium = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimary,
      height: 1.5,
      fontFamily: fontFamily);

  static const TextStyle bodySmall = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: AppColors.textSecondary,
      height: 1.5,
      fontFamily: fontFamily);

  /// Button text
  static const TextStyle buttonLarge = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.0,
      fontFamily: fontFamily);

  static const TextStyle buttonMedium = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.0,
      fontFamily: fontFamily);

  static const TextStyle buttonSmall = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.0,
      fontFamily: fontFamily);

  /// Caption and overline
  static const TextStyle caption = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: AppColors.textSecondary,
      letterSpacing: 0.4,
      height: 1.2,
      fontFamily: fontFamily);

  static const TextStyle overline = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: AppColors.textSecondary,
      letterSpacing: 1.5,
      height: 1.2,
      textBaseline: TextBaseline.alphabetic,
      fontFamily: fontFamily);
}
