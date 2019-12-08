import 'package:fluro/fluro.dart';
import 'package:wechat_app/routers/router_init.dart';

import 'page/home_page.dart';

class HomeRouter implements IRouterProvider{
  static String homePage = "/home";

  @override
  void initRouter(Router router) {
    router.define(homePage, handler: Handler(handlerFunc: (_, params) => HomePage()));
  }

}