import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wechat_app/common/loadAssetSvg.dart';
import 'package:wechat_app/components/custom_cell.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: false)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "通讯录",
          style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(36),
              fontWeight: FontWeight.w600
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: LoadAssetSvg(
              "icons_outlined_search",
              width: ScreenUtil.getInstance().setWidth(60),
            ),
            onPressed: (){

            },
          ),
          IconButton(
            icon: LoadAssetSvg(
              "icons_outlined_addoutline",
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
            CustomCell(
              customChild: Container(
                padding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(20)),
                decoration: BoxDecoration(
                  color: Color(0xffF6A03D),
                  borderRadius: BorderRadius.circular(ScreenUtil.getInstance().setWidth(10))
                ),
                child: LoadAssetSvg(
                  "icons_filled_add-friends",
                  width: ScreenUtil.getInstance().setWidth(43),
                  color: Colors.white,
                ),
              ),
              title: "新的朋友",
              color: Color(0xff10BA6E),
              border: true,
              onTap: (){

              },
            ),
            CustomCell(
              customChild: Container(
                padding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(20)),
                decoration: BoxDecoration(
                    color: Color(0xff11BE5D),
                    borderRadius: BorderRadius.circular(ScreenUtil.getInstance().setWidth(10))
                ),
                child: LoadAssetSvg(
                  "icons_filled_group-detail",
                  width: ScreenUtil.getInstance().setWidth(43),
                  color: Colors.white,
                ),
              ),
              title: "群聊",
              color: Color(0xff10BA6E),
              border: true,
              onTap: (){

              },
            ),
            CustomCell(
              customChild: Container(
                padding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(20)),
                decoration: BoxDecoration(
                    color: Color(0xff277FD8),
                    borderRadius: BorderRadius.circular(ScreenUtil.getInstance().setWidth(10))
                ),
                child: LoadAssetSvg(
                  "icons_filled_tag",
                  width: ScreenUtil.getInstance().setWidth(43),
                  color: Colors.white,
                ),
              ),
              title: "标签",
              color: Color(0xff10BA6E),
              border: true,
              onTap: (){

              },
            ),
            CustomCell(
              customChild: Container(
                padding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(20)),
                decoration: BoxDecoration(
                    color: Color(0xff2A80D3),
                    borderRadius: BorderRadius.circular(ScreenUtil.getInstance().setWidth(10))
                ),
                child: LoadAssetSvg(
                  "icons_filled_official-accounts",
                  width: ScreenUtil.getInstance().setWidth(43),
                  color: Colors.white,
                ),
              ),
              title: "公众号",
              color: Color(0xff10BA6E),
              border: true,
              onTap: (){

              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
