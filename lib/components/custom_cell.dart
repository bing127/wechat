import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wechat_app/common/loadAssetSvg.dart';


class CustomCell extends StatelessWidget {
  final String url;
  final String title;
  final bool border;
  final bool arrow;
  final Widget customChild;
  final bool gap;
  final Color color;
  final GestureTapCallback onTap;

  const CustomCell({
    Key key,
    this.url,
    this.title,
    this.color,
    this.border:true,
    this.arrow:false,
    this.gap:false,
    this.customChild,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: false)..init(context);
    return Container(
      margin: EdgeInsets.only(
          bottom: gap ? ScreenUtil.getInstance().setHeight(15) : 0
      ),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
              padding: EdgeInsets.only(
                left: ScreenUtil.getInstance().setWidth(30),
              ),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Container(
                    child: customChild != null ? customChild : LoadAssetSvg(
                      "$url",
                      width: ScreenUtil.getInstance().setWidth(46),
                      color: color,
                    ),
                    padding: EdgeInsets.only(right: ScreenUtil.getInstance().setWidth(20),),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(
                            right: ScreenUtil.getInstance().setWidth(30),
                            top: ScreenUtil.getInstance().setWidth(25),
                            bottom: ScreenUtil.getInstance().setWidth(25)
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: border ? Color(0xffEDEDED) : Colors.transparent,
                                    width: ScreenUtil.getInstance().setWidth(1)
                                )
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "$title",
                                style: TextStyle(
                                    fontSize: ScreenUtil.getInstance().setSp(33)
                                ),
                              ),
                            ),
                            LoadAssetSvg(
                              "icons_outlined_arrow",
                              width: ScreenUtil.getInstance().setSp(25),
                            ),
                          ],
                        ),
                      )
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}
