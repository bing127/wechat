import 'package:fluro/fluro.dart';
import 'package:wechat_app/routers/router_init.dart';

import 'page/my_page.dart';

class MyRouter implements IRouterProvider{
  static String myPage = "/my";

  @override
  void initRouter(Router router) {
    router.define(myPage, handler: Handler(handlerFunc: (_, params) => MyPage()));
  }

}