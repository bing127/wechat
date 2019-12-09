import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


//入口页面
import 'package:wechat_app/page/app_page.dart';

  void main() async{
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]).then((_) => runApp(AppPage()));
    // 透明状态栏
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
