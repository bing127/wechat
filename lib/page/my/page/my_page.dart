import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wechat_app/common/loadAssetSvg.dart';
import 'package:wechat_app/components/custom_cell.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: false)..init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: LoadAssetSvg(
              "icons_filled_camera",
              width: ScreenUtil.getInstance().setWidth(50),
            ),
            onPressed: (){

            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            _userView(),
            CustomCell(
              url: "icons_outlined_wechatpay",
              title: "支付",
              color: Color(0xff10BA6E),
              border: false,
              arrow: true,
              gap: true,
              onTap: (){

              },
            ),
            CustomCell(
              url: "icons_outlined_colorful_favorites",
              title: "收藏",
              border: true,
              arrow: true,
              onTap: (){

              },
            ),
            CustomCell(
              url: "icons_outlined_album",
              title: "相册",
              color: Color(0xff60A7DA),
              border: true,
              arrow: true,
              onTap: (){

              },
            ),
            CustomCell(
              url: "icons_outlined_colorful_cards",
              title: "卡包",
              border: true,
              arrow: true,
              onTap: (){

              },
            ),
            CustomCell(
              url: "icons_outlined_sticker",
              title: "表情",
              border: true,
              color: Color(0xffEDA159),
              arrow: true,
              gap: true,
              onTap: (){

              },
            ),
            CustomCell(
              url: "icons_outlined_setting",
              title: "设置",
              border: false,
              color: Color(0xff2D7FD6),
              arrow: true,
              onTap: (){

              },
            ),
          ],
        ),
      ),
    );
  }


  Widget _userView(){
    return Container(
      padding: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(20),
        left: ScreenUtil.getInstance().setWidth(30),
        right: ScreenUtil.getInstance().setWidth(30),
        bottom: ScreenUtil.getInstance().setHeight(50)
      ),
      margin: EdgeInsets.only(
        bottom: ScreenUtil.getInstance().setHeight(15)
      ),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            child: PhysicalModel(
              color: Colors.transparent,
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(ScreenUtil.getInstance().setWidth(10)),
              child: Image.asset(
                "assets/images/perch/avatar.jpg",
                width: ScreenUtil.getInstance().setWidth(120),
                height: ScreenUtil.getInstance().setWidth(120),
              ),
            ),
            padding: EdgeInsets.only(
              right: ScreenUtil.getInstance().setWidth(30)
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: ScreenUtil.getInstance().setWidth(120),
              padding: EdgeInsets.only(
                top: ScreenUtil.getInstance().setHeight(5),
                bottom: ScreenUtil.getInstance().setHeight(5)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "哆啦a梦",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(40),
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          "wxid_d32daa6u7wfc86",
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(30),
                              color: Color(0xff8F8F8F)
                          ),
                        ),
                      ),
                      LoadAssetSvg(
                        "icons_outlined_qr-code",
                        width: ScreenUtil.getInstance().setWidth(35),
                        color: Color(0xff8F8F8F)
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: ScreenUtil.getInstance().setWidth(30)
                        ),
                        child: LoadAssetSvg(
                          "icons_outlined_arrow",
                          width: ScreenUtil.getInstance().setSp(25),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

