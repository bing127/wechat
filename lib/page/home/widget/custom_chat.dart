import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wechat_app/common/loadAssetSvg.dart';


enum ChatType{
  GROUP,
  NEWS,
  PUBLIC_ACCOUNT,
  SINGLE,
  FILE,
  SPORT,
  EMAIL,
  PAY,
  GAME
}

enum ReceiverType{
  TEXT,
  VOICE,
  VIDEO,
  SOUND,
  SMALL_VIDEO,
  EXPRESSION,
  IMAGE,
  LOCATION,
  RED_PACKAGE,
  FILE
}



class CustomChat extends StatelessWidget {
  final String title;
  final String avatar;
  final String content;
  final String time;
  final ChatType chatType;
  final ReceiverType receiverType;
  final bool border;
  final bool isOpen;
  final List<String> listPic;
  final int badges;
  final GestureTapCallback onTap;
  final bool showBadges;

  const CustomChat({
    Key key,
    this.title,
    this.badges,
    this.avatar,
    this.listPic,
    this.content,
    this.time,
    this.chatType:ChatType.SINGLE,
    this.receiverType:ReceiverType.TEXT,
    this.border:true,
    this.isOpen:false,
    this.showBadges:true,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: false)..init(context);
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(
              left: ScreenUtil.getInstance().setWidth(30),
          ),
          child: Container(
            padding: EdgeInsets.only(
                right: ScreenUtil.getInstance().setWidth(30),
                top: ScreenUtil.getInstance().setWidth(20),
                bottom: ScreenUtil.getInstance().setWidth(20)
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: border ? Color(0xffEDEDED) : Colors.transparent,
                  width: ScreenUtil.getInstance().setWidth(1)
                )
              )
            ),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                _chatTypeView(chatType, avatar,listPic),
                SizedBox(
                  width: ScreenUtil.getInstance().setWidth(20),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                                child: Container(
                                  child: Text(
                                    "$title",
                                    style: TextStyle(
                                        fontSize: ScreenUtil.getInstance().setSp(33),
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff111111)
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  padding: EdgeInsets.only(
                                      right: ScreenUtil.getInstance().setWidth(15)
                                  ),
                                )
                            ),
                            Text(
                              "$time",
                              style: TextStyle(
                                  fontSize: ScreenUtil.getInstance().setSp(28),
                                  color: Color(0xffB8B8B8)
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            _receiverTypeView(receiverType,content),
                            isOpen ? LoadAssetSvg(
                              "icons_outlined_mute",
                              width: ScreenUtil.getInstance().setWidth(40),
                              color: Color(0xffAEAEAE),
                            ) : SizedBox()
                          ],
                        ),
                      ],
                    ),
                    height: ScreenUtil.getInstance().setHeight(100),
                  ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }


  Widget _receiverTypeView(ReceiverType type,String content){
    String title;

    switch(type) {
      case ReceiverType.TEXT: {
        title = content;
      }
      break;
      case ReceiverType.EXPRESSION: {
        title = "TO DO表情";
      }
      break;
      case ReceiverType.LOCATION: {
        title = '[位置]';
      }
      break;
      case ReceiverType.VIDEO: {
        title = '[视频通话]';
      }
      break;
      case ReceiverType.SMALL_VIDEO: {
        title = '[小视频]';
      }
      break;
      case ReceiverType.IMAGE: {
        title = '[图片]';
      }
      break;
      case ReceiverType.VOICE: {
        title = '[语音通话]';
      }
      break;
      case ReceiverType.SOUND: {
        title = '[语音]';
      }
      break;
      case ReceiverType.RED_PACKAGE: {
        title = '[微信红包]恭喜发财，大吉大利';
      }
      break;
      case ReceiverType.FILE: {
        title = '[文件]';
      }
      break;
      default: {
        title = content;
      }
      break;
    }



    return Expanded(
        child: Container(
          child: Text(
            "$title",
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(28),
              color: Color(0xffAEAEAE),
            ),
            overflow: TextOverflow.ellipsis,
          ),
          padding: EdgeInsets.only(
              right: ScreenUtil.getInstance().setWidth(15)
          ),
        )
    );
  }

  Widget _chatTypeView(ChatType chatType,String img,List<String> listPic){
    dynamic url;
    switch(chatType) {
      case ChatType.SINGLE: {
        url = Container(
          child: CachedNetworkImage(
            imageUrl: avatar,
            width: ScreenUtil.getInstance().setWidth(100),
            height: ScreenUtil.getInstance().setWidth(100),
          )
        );
      }
      break;
      case ChatType.GROUP: {
        url = _groupAvatar(listPic);
      }
      break;
      case ChatType.FILE: {
        url = _chatLeading(
          color: Color(0xff2BA246),
          child: LoadAssetSvg(
            "icons_filled_folder",
            color: Colors.white,
          )
        );
      }
      break;
      case ChatType.EMAIL: {
        url = _chatLeading(
            color: Color(0xff2782D7),
            child: LoadAssetSvg(
              "icons_filled_email",
              color: Colors.white,
            )
        );
      }
      break;
      case ChatType.GAME: {
        url = _chatLeading(
            color: Colors.white,
            child: LoadAssetSvg(
              "icons_outlined_colorful_game_fill",
              width: ScreenUtil.getInstance().setWidth(80),
            )
        );
      }
      break;
      case ChatType.PAY: {
        url = _chatLeading(
            color: Colors.white,
            child: LoadAssetSvg(
              "wcchatpay_contact_avatar_big",
              width: ScreenUtil.getInstance().setWidth(100),
            )
        );
      }
      break;
      default: {
        url = Container(
          child: Image.asset(
            "assets/images/perch/20170823110912_ezTtH.jpeg",
            width: ScreenUtil.getInstance().setWidth(100),
            height: ScreenUtil.getInstance().setWidth(100),
          ),
        );
      }
      break;
    }

    return Badge(
      elevation: 0,
      badgeContent: showBadges ? (
        chatType == ChatType.GROUP ? SizedBox() : Text(
          "${ badges.toString() }",
          style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil.getInstance().setSp(22)
          ),
        )
      ) : SizedBox(),
      position: BadgePosition(
          right: -ScreenUtil.getInstance().setWidth(5),
          top: -ScreenUtil.getInstance().setWidth(badges!= null && badges> 10 ? 8 : 15)
      ),
      padding: EdgeInsets.all( showBadges ? chatType == ChatType.GROUP ? ScreenUtil.getInstance().setWidth(9) : (
        badges> 10 ? ScreenUtil.getInstance().setWidth(7) : ScreenUtil.getInstance().setWidth(13)
      ) : 0 ),
      child: PhysicalModel(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        borderRadius:BorderRadius.circular(ScreenUtil.getInstance().setWidth(10)),
        child:url
      ),
    );
  }

  Widget _groupAvatar(List<String> list){
    return PhysicalModel(
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: ScreenUtil.getInstance().setWidth(100),
        height: ScreenUtil.getInstance().setWidth(100),
        child: GridView.builder(
            itemCount: list.length,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              crossAxisSpacing: ScreenUtil.getInstance().setWidth(2),
              mainAxisSpacing: ScreenUtil.getInstance().setWidth(2)
            ),
            itemBuilder: (BuildContext context,int index){
              return Container(
                child: CachedNetworkImage(
                  imageUrl: list[index],
                  width: ScreenUtil.getInstance().setWidth(100)/3,
                  height: ScreenUtil.getInstance().setWidth(100)/3,
                ),
              );
            }
        )
      ),
    );
  }

  Widget _chatLeading({ Widget child,Color color }){
    return PhysicalModel(
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      borderRadius:BorderRadius.circular(ScreenUtil.getInstance().setWidth(10)),
      child: Container(
        width: ScreenUtil.getInstance().setWidth(100),
        height: ScreenUtil.getInstance().setWidth(100),
        child: child,
        alignment: Alignment.center,
        color: color,
      ),
    );
  }
}


