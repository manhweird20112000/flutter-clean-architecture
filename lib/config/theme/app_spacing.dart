import 'package:flutter/material.dart';

/// Defines spacing constants for the application
class AppSpacing {
  /// Padding and margin values
  static const double xs = 4.0;
  static const double s = 8.0;
  static const double m = 16.0;
  static const double l = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double xxxl = 64.0;
  
  /// Gap widgets for creating consistent vertical spacing
  static const SizedBox vGapXs = SizedBox(height: xs);
  static const SizedBox vGapS = SizedBox(height: s);
  static const SizedBox vGapM = SizedBox(height: m);
  static const SizedBox vGapL = SizedBox(height: l);
  static const SizedBox vGapXl = SizedBox(height: xl);
  static const SizedBox vGapXxl = SizedBox(height: xxl);
  static const SizedBox vGapXxxl = SizedBox(height: xxxl);
  
  /// Gap widgets for creating consistent horizontal spacing
  static const SizedBox hGapXs = SizedBox(width: xs);
  static const SizedBox hGapS = SizedBox(width: s);
  static const SizedBox hGapM = SizedBox(width: m);
  static const SizedBox hGapL = SizedBox(width: l);
  static const SizedBox hGapXl = SizedBox(width: xl);
  static const SizedBox hGapXxl = SizedBox(width: xxl);
  static const SizedBox hGapXxxl = SizedBox(width: xxxl);
  
  /// Edge insets for padding
  static const EdgeInsets paddingXs = EdgeInsets.all(xs);
  static const EdgeInsets paddingS = EdgeInsets.all(s);
  static const EdgeInsets paddingM = EdgeInsets.all(m);
  static const EdgeInsets paddingL = EdgeInsets.all(l);
  static const EdgeInsets paddingXl = EdgeInsets.all(xl);
  
  /// Edge insets for horizontal padding
  static const EdgeInsets paddingHXs = EdgeInsets.symmetric(horizontal: xs);
  static const EdgeInsets paddingHS = EdgeInsets.symmetric(horizontal: s);
  static const EdgeInsets paddingHM = EdgeInsets.symmetric(horizontal: m);
  static const EdgeInsets paddingHL = EdgeInsets.symmetric(horizontal: l);
  static const EdgeInsets paddingHXl = EdgeInsets.symmetric(horizontal: xl);
  
  /// Edge insets for vertical padding
  static const EdgeInsets paddingVXs = EdgeInsets.symmetric(vertical: xs);
  static const EdgeInsets paddingVS = EdgeInsets.symmetric(vertical: s);
  static const EdgeInsets paddingVM = EdgeInsets.symmetric(vertical: m);
  static const EdgeInsets paddingVL = EdgeInsets.symmetric(vertical: l);
  static const EdgeInsets paddingVXl = EdgeInsets.symmetric(vertical: xl);
  
  /// Standard screen padding
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: m,
    vertical: m,
  );
  
  /// Border radius
  static const double borderRadiusXs = 4.0;
  static const double borderRadiusS = 8.0;
  static const double borderRadiusM = 12.0;
  static const double borderRadiusL = 16.0;
  static const double borderRadiusXl = 24.0;
  static const double borderRadiusCircular = 100.0;
} 