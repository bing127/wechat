import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wechat_app/page/app_main.dart';
import 'package:wechat_app/routers/application.dart';
import 'package:wechat_app/routers/routers.dart';


class AppPage extends StatefulWidget {

  AppPage() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: '微信',
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color(0xff07c160),
            accentColor: Color(0xff07c160),
            scaffoldBackgroundColor:Color(0xffEDEDED),
            buttonColor: Color(0xff07c160),
            appBarTheme: AppBarTheme(
                elevation: 0,
                brightness: Brightness.dark
            )
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('zh', 'CH'),
          Locale('en', 'US')
        ],
        home: AppMain()
      ),
    );
  }
}

