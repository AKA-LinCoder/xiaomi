import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:xiaomi/app/services/language.dart';

import 'app/routes/app_pages.dart';

void main() async{

  Locale deviceLocale = const Locale('zh','CN');
  WidgetsFlutterBinding.ensureInitialized();
  if (Get.deviceLocale?.languageCode == 'zh') {
    if (Get.deviceLocale?.scriptCode == 'Hans') {
      // 执行根据中文简体加载对应语言文件的逻辑
    } else if (Get.deviceLocale?.scriptCode == 'Hant') {
      // 执行根据中文繁体加载对应语言文件的逻辑
    } else {
      // 执行根据其他中文语言码加载对应语言文件的逻辑
    }
    deviceLocale = const Locale('zh','CN');
  }else{
    deviceLocale = const Locale('en','US');
  }

  //设置透明状态栏
  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

  runApp(
    ScreenUtilInit(
      designSize: const Size(1080, 2400),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return GetMaterialApp(
          title: "Application",
          debugShowCheckedModeBanner: false,
          translations: Messages(),
          locale: deviceLocale,
          //配置主题
          theme: ThemeData(
            primarySwatch: Colors.grey
          ),
          fallbackLocale: const Locale('en','US'),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          //配置iOS动画
          defaultTransition: Transition.rightToLeft,
        );
      },
    ),
  );
  // runApp(MyApp());
}
