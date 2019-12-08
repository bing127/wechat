import 'package:fluro/fluro.dart';
import 'package:wechat_app/routers/router_init.dart';

import 'page/find_page.dart';


class FindRouter implements IRouterProvider{
  static String findPage = "/find";

  @override
  void initRouter(Router router) {
    router.define(findPage, handler: Handler(handlerFunc: (_, params) => FindPage()));
  }

}