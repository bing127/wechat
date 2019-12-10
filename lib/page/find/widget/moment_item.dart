import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wechat_app/common/loadAssetSvg.dart';

class MomentItem extends StatefulWidget {
  @override
  _MomentItemState createState() => _MomentItemState();
}

class _MomentItemState extends State<MomentItem> {
  bool _isShow = false;


  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: false)..init(context);
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(
            left: ScreenUtil.getInstance().setWidth(30),
            right: ScreenUtil.getInstance().setWidth(30),
            bottom: ScreenUtil.getInstance().setHeight(50)
        ),
        child: Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PhysicalModel(
              color: Colors.transparent,
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(ScreenUtil.getInstance().setWidth(10)),
              child: CachedNetworkImage(
                width: ScreenUtil.getInstance().setWidth(100),
                height: ScreenUtil.getInstance().setWidth(100),
                imageUrl: "http://img.qqzhi.com/uploads/2018-12-02/175140124.jpg",
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(
                    left: ScreenUtil.getInstance().setWidth(20)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "测试工程师-张三",
                        style: TextStyle(
                            color: Color(0xff4F5390),
                            fontSize: ScreenUtil.getInstance().setSp(32),
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: ScreenUtil.getInstance().setWidth(20),
                          bottom: ScreenUtil.getInstance().setWidth(20)
                      ),
                      child: Text(
                        "哪有人会是一张白纸啊，大家都是带着爱与恨、往事与阴影活着。有的人藏得深有的人藏不住而已。",
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(30)
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "23分钟前",
                          style: TextStyle(
                              color: Color(0xff7D7D7D),
                              fontSize: ScreenUtil.getInstance().setSp(28)
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                width: _isShow ? ScreenUtil.getInstance().setWidth(280) : 0,
                                margin: EdgeInsets.only(
                                    right: ScreenUtil.getInstance().setWidth(20)
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(0,0,0,.8),
                                          borderRadius: BorderRadius.circular(ScreenUtil.getInstance().setWidth(10))
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          _popupItem(
                                              title: "赞",
                                              icon: "mp_like"
                                          ),
                                          _popupItem(
                                              title: "评论",
                                              icon: "icons_outlined_comment"
                                          )
                                        ],
                                      ),
                                      padding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(10)),
                                    )
                                  ],
                                ),
                              ),
                              Material(
                                color: Color(0xffF7F7F7),
                                borderRadius: BorderRadius.circular(ScreenUtil.getInstance().setWidth(5)),
                                child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        _isShow = !_isShow;
                                      });
                                    },
                                    child: Container(
                                      child: LoadAssetSvg(
                                        "icons_filled_more",
                                        width: ScreenUtil.getInstance().setWidth(40),
                                        color: Color(0xff7D7D7D),
                                      ),
                                      width: ScreenUtil.getInstance().setWidth(60),
                                      height: ScreenUtil.getInstance().setHeight(40),
                                    )
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xffF7F7F7),
                          borderRadius: BorderRadius.circular(ScreenUtil.getInstance().setWidth(5))
                      ),
                      margin: EdgeInsets.only(
                          top: ScreenUtil.getInstance().setHeight(15)
                      ),
                      padding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(15)),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: <Widget>[
                              Text(
                                "张三,",
                                style: TextStyle(
                                    fontSize: ScreenUtil.getInstance().setSp(28),
                                    color: Color(0xff586597)
                                ),
                              ),
                              Text(
                                "张三",
                                style: TextStyle(
                                    fontSize: ScreenUtil.getInstance().setSp(28),
                                    color: Color(0xff586597)
                                ),
                              ),
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  top: ScreenUtil.getInstance().setHeight(15)
                              ),
                              child: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '张三：',
                                        style: TextStyle(
                                            fontSize: ScreenUtil.getInstance().setSp(28),
                                            color: Color(0xff586597)
                                        )
                                    ),
                                    TextSpan(
                                        text: '是啊',
                                        style: TextStyle(
                                            color: Color(0xff303030)
                                        )
                                    ),
                                  ],
                                ),
                              )
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  top: ScreenUtil.getInstance().setHeight(15)
                              ),
                              child: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '张三：',
                                        style: TextStyle(
                                            fontSize: ScreenUtil.getInstance().setSp(28),
                                            color: Color(0xff586597)
                                        )
                                    ),
                                    TextSpan(
                                        text: '天天尽撒些没有的鸡汤',
                                        style: TextStyle(
                                            color: Color(0xff303030)
                                        )
                                    ),
                                  ],
                                ),
                              )
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _popupItem({ String title,String icon }){
    return Container(
      margin: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(20),
        right: ScreenUtil.getInstance().setWidth(20)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              "$title",
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil.getInstance().setSp(30)
            ),
          ),
          SizedBox(
            width: ScreenUtil.getInstance().setWidth(5),
          ),
          LoadAssetSvg(
              "$icon",
            width: ScreenUtil.getInstance().setWidth(40),
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
