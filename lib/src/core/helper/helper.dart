
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils.dart';
import '../../utils/constants/constants.dart';

class Helper {
  /// Get svg picture path
  static String getSvgPath(String name) {
    return "$svgPath$name";
  }

  /// Get image picture path
  static String getImagePath(String name) {
    return "$imagePath$name";
  }

  /// Get vertical space
  static double getVerticalSpace() {
    return 24.h;
  }

  /// Get horizontal space
  static double getHorizontalSpace() {
    return 24.w;
  }
}