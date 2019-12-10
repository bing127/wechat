import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui show window;

import 'package:wechat_app/common/loadAssetSvg.dart';
import 'package:wechat_app/page/find/widget/moment_item.dart';

class MomentsPage extends StatefulWidget {
  @override
  _MomentsPageState createState() => _MomentsPageState();
}

class _MomentsPageState extends State<MomentsPage> {
  final ScrollController _scrollController = new ScrollController();
  double navAlpha = 0;
  double headerHeight = 280;
  String title = '';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      if (offset < 0) {
        if (navAlpha != 0) {
          setState(() {
            navAlpha = 0;
          });
        }
      } else if (offset < headerHeight) {
        if (headerHeight - offset <= navigationBarHeight) {
          setState(() {
            title = '朋友圈';
          });
        } else {
          title = '';
        }
        setState((){
          navAlpha = 1 - (headerHeight - offset) / headerHeight;
        });
      } else if (navAlpha != 1) {
        setState((){
          navAlpha = 1;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
    ScreenUtil(width: 750, height: 1334, allowFontScaling: false)
      ..init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(children: <Widget>[
                Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    Container(
                        child: CachedNetworkImage(
                            imageUrl: 'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1575941259&di=2aa675f98e990040174f83db9bd0263e&src=http://b-ssl.duitang.com/uploads/item/201706/29/20170629231122_wf4rE.jpeg',
                            fit: BoxFit.cover,
                            height: headerHeight,
                            width: double.infinity
                        ),
                        margin: EdgeInsets.only(bottom: ScreenUtil.getInstance().setHeight(60))
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      right: 0,
                      child: Container(
                          height: headerHeight,
                          width: double.infinity,
                          color: Color.fromRGBO(0,0,0,.1),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                          right: ScreenUtil.getInstance().setWidth(30)
                        ),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                child: Text(
                                    '张三',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: ScreenUtil.getInstance().setSp(33),
                                        shadows:[
                                          BoxShadow(
                                            color: Color(0xff111111),
                                            blurRadius: ScreenUtil.getInstance().setWidth(2),
                                            offset: Offset(ScreenUtil.getInstance().setWidth(1.5), ScreenUtil.getInstance().setWidth(1.5)),
                                          ),
                                        ]
                                    ),
                                ),
                                padding: EdgeInsets.only(
                                  top: ScreenUtil.getInstance().setHeight(20),
                                  right: ScreenUtil.getInstance().setWidth(20)
                                ),
                              ),
                              PhysicalModel(
                                color: Colors.transparent,
                                clipBehavior: Clip.antiAlias,
                                borderRadius: BorderRadius.circular(ScreenUtil.getInstance().setWidth(10)),
                                child: CachedNetworkImage(
                                  imageUrl: 'http://cdn.duitang.com/uploads/item/201409/18/20140918141220_N4Tic.thumb.700_0.jpeg',
                                  height: ScreenUtil.getInstance().setWidth(140),
                                  width: ScreenUtil.getInstance().setWidth(140),
                                ),
                              )
                            ]
                        ),
                      ),
                  ],
                ),
                Container(
                  color: Colors.white,
                  child: ListView(
                    shrinkWrap: true,
                    primary: false,
                    children: <Widget>[
                      MomentItem(),
                      MomentItem(),
                      MomentItem(),
                      MomentItem(),
                      MomentItem(),
                      MomentItem(),
                      MomentItem(),
                      MomentItem(),
                      MomentItem(),
                      MomentItem(),
                      MomentItem(),
                      MomentItem(),
                      MomentItem(),
                      MomentItem(),
                    ],
                  ),
                )
              ]),
            ),
            Container(
              height: navigationBarHeight,
              child: AppBar(
                titleSpacing: 0,
                iconTheme: IconThemeData(
                  color: Color(0xff111111),
                ),
                actions: <Widget>[
                  IconButton(
                      icon: LoadAssetSvg(
                          "icons_filled_camera",
                        width: ScreenUtil.getInstance().setWidth(50),
                      ),
                      onPressed: null
                  )
                ],
                elevation: 0.0,
                backgroundColor:Color.fromRGBO(242,242,242, navAlpha),
                title: Text(title,
                    style:TextStyle(
                        color: Color.fromARGB((navAlpha * 255).toInt(), 0, 0, 0),
                        fontSize: ScreenUtil.getInstance().setSp(36),
                        fontWeight: FontWeight.w600
                    ),
                ),
              ),
            ),
          ],
        )
    );
  }


  static double get navigationBarHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.top + kToolbarHeight;
  }
}
