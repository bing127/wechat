import 'package:fluro/fluro.dart';
import 'package:wechat_app/page/find/page/moments_page.dart';
import 'package:wechat_app/routers/router_init.dart';

import 'page/find_page.dart';


class FindRouter implements IRouterProvider{
  static String findPage = "/find";
  static String momentsPage = "/find/Moments";

  @override
  void initRouter(Router router) {
    router.define(findPage, handler: Handler(handlerFunc: (_, params) => FindPage()));
    router.define(momentsPage, handler: Handler(handlerFunc: (_, params) => MomentsPage()));
  }

}