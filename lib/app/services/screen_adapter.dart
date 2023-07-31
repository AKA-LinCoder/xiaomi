import 'package:flutter_screenutil/flutter_screenutil.dart';

/// FileName screen_adapter
///
/// @Author LinGuanYu
/// @Date 2023/6/10 16:05
///
/// @Description TODO 封装屏幕适配

class ScreenAdapter{
  static width(num v){
    return v.w;
  }

  static height(num v){
    return v.h;
  }

  static fontSize(num v){
    return v.sp;
  }

  static getScreenWidth(){
    return 1.sw;
  }

  static getScreenHeight(){
    return 1.sh;
  }
  static getStatusBarHeight (){
    return ScreenUtil().statusBarHeight;  //状态栏高度 刘海屏会更高
  }
}