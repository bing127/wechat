import 'package:fluro/fluro.dart';
import 'package:wechat_app/routers/router_init.dart';

import 'page/contact_page.dart';


class ContactRouter implements IRouterProvider{
  static String contactPage = "/contact";

  @override
  void initRouter(Router router) {
    router.define(contactPage, handler: Handler(handlerFunc: (_, params) => ContactPage()));
  }

}