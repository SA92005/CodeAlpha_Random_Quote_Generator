import 'package:flutter/material.dart';
import 'package:random_quote_generator/core/theme/app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  // Title
  static const TextStyle title = TextStyle(
    color: AppColors.titleColor,
    fontSize: 34,
    fontWeight: FontWeight.w600,
  );

  // Quote
  static const TextStyle quote = TextStyle(
    color: AppColors.quoteColor,
    fontSize: 27,
    fontStyle: FontStyle.normal,
    height: 1.6,
  );

  // Author
  static const TextStyle author = TextStyle(
    color: AppColors.authorColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  // Button
  static const TextStyle button = TextStyle(
    color: AppColors.buttonText,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  // Error
  static const TextStyle error = TextStyle(
    color: AppColors.quoteColor,
    fontSize: 16,
  );
}
