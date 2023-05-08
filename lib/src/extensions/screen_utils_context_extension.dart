import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ContextExtension on BuildContext {
  double get screenWidth => ScreenUtil().screenWidth;
  double get screenHeight => ScreenUtil().screenHeight;
  double get blockSizeHorizontal => ScreenUtil().screenWidth / 100;
  double get blockSizeVertical => ScreenUtil().screenHeight / 100;
  double setWidth(double width) => ScreenUtil().setWidth(width);
  double setHeight(double height) => ScreenUtil().setHeight(height);
  double setSp(double fontSize) => ScreenUtil().setSp(fontSize);

  double get appBarHeight => ScreenUtil().setHeight(56);
  double get appBarIconSize => ScreenUtil().setWidth(24);
}