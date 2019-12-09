import 'package:fluro/fluro.dart';
import 'package:wechat_app/routers/router_init.dart';

import 'page/home_page.dart';
import 'page/chat_page.dart';

class HomeRouter implements IRouterProvider{
  static String homePage = "/home";
  static String chatPage = "/home/chat";

  @override
  void initRouter(Router router) {
    router.define(homePage, handler: Handler(handlerFunc: (_, params) => HomePage()));
    router.define(chatPage, handler: Handler(handlerFunc: (_, params) => ChatPage()));
  }

}