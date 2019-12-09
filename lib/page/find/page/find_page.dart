import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wechat_app/common/loadAssetSvg.dart';
import 'package:wechat_app/components/custom_cell.dart';

class FindPage extends StatefulWidget {
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: false)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "发现",
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
              url: "icons_outlined_colorful_moment",
              title: "朋友圈",
              border: false,
              arrow: true,
              gap: true,
              onTap: (){

              },
            ),
            CustomCell(
              url: "icons_outlined_mini-program2",
              title: "小程序",
              border: false,
              arrow: true,
              color: Color(0xff6E70DA),
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
