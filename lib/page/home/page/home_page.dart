import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wechat_app/common/loadAssetSvg.dart';
import 'package:wechat_app/page/home/home_router.dart';
import 'package:wechat_app/page/home/widget/custom_chat.dart';
import 'package:wechat_app/routers/fluro_navigator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: false)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "微信",
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
        bottom: PreferredSize(
          child: _pcLoginView(),
          preferredSize: Size.fromHeight(ScreenUtil.getInstance().setHeight(80)),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            CustomChat(
              title:'梓童',
              avatar:'http://tupian.qqjay.com/tou2/2018/1210/545e977a488d942d8c0305a7a7e57e1f.jpg',
              time:'09:23',
              content:"[3条]今晚有时间么？一块吃个饭",
              badges:20,
              chatType: ChatType.SINGLE,
              receiverType: ReceiverType.TEXT,
              onTap: (){
                NavigatorUtils.push(context, HomeRouter.chatPage);
              },
            ),
            CustomChat(
              title:'李四',
              avatar:'http://b-ssl.duitang.com/uploads/item/201707/24/20170724111940_ckKW2.thumb.700_0.jpeg',
              time:'22:53',
              content:"[3条]今晚吃鸡",
              badges:9,
              chatType: ChatType.SINGLE,
              receiverType: ReceiverType.RED_PACKAGE,
              onTap: (){

              },
            ),
            CustomChat(
              title:'文件传输助手',
              avatar:'',
              time:'17:35',
              chatType: ChatType.FILE,
              receiverType: ReceiverType.FILE,
              showBadges: false,
              onTap: (){

              },
            ),
            CustomChat(
              title:'QQ邮箱提醒',
              content: "Re: [ruanyf/es6tutorial] Update let.md (#930)",
              time:'昨天',
              chatType: ChatType.EMAIL,
              receiverType: ReceiverType.TEXT,
              showBadges: false,
              onTap: (){

              },
            ),
            CustomChat(
              title:'哈哈',
              avatar:'http://b-ssl.duitang.com/uploads/item/201609/04/20160904212716_inuYt.thumb.700_0.jpeg',
              time:'12月7日',
              content:"[3条]你今天几点下班呢？",
              badges:2,
              chatType: ChatType.SINGLE,
              receiverType: ReceiverType.TEXT,
              onTap: (){

              },
            ),
            CustomChat(
              title:'微信游戏',
              time:'12月6日',
              content: "京剧系列震撼登场！",
              chatType: ChatType.GAME,
              receiverType: ReceiverType.TEXT,
              showBadges: false,
              onTap: (){

              },
            ),
            CustomChat(
              title:'杨静',
              avatar:'http://img.qqzhi.com/uploads/2018-12-02/175140124.jpg',
              time:'12月5日',
              content:"[3条]你今天几点下班呢？",
              badges:3,
              chatType: ChatType.SINGLE,
              receiverType: ReceiverType.VIDEO,
              onTap: (){

              },
            ),
            CustomChat(
              title:'微信支付',
              time:'12月7日',
              content: "微信支付相关凭证！",
              chatType: ChatType.PAY,
              receiverType: ReceiverType.TEXT,
              showBadges: false,
              onTap: (){

              },
            ),
            CustomChat(
              title:'张三',
              avatar:'',
              time:'12月7日',
              content:"[3条]今晚吃鸡",
              badges:20,
              chatType: ChatType.GROUP,
              listPic:[
                "http://b-ssl.duitang.com/uploads/item/201410/09/20141009224754_AswrQ.jpeg",
                "http://pic1.zhimg.com/50/v2-6444e641d0235006e81bc4210b5da89b_hd.jpg",
                "http://img3.duitang.com/uploads/item/201602/18/20160218003123_aLMyv.jpeg",
                "http://b-ssl.duitang.com/uploads/item/201510/02/20151002093928_CTkZ3.jpeg",
                "http://b-ssl.duitang.com/uploads/item/201801/24/20180124192600_sfctr.thumb.700_0.jpeg",
                "http://pic1.zhimg.com/50/v2-7aef9f2af33309f512ea494a2b39d8c9_hd.jpg",
                "http://b-ssl.duitang.com/uploads/item/201809/26/20180926162125_vjbwi.jpg",
                "http://b-ssl.duitang.com/uploads/item/201810/17/20181017214958_nezby.jpg",
                "http://pic1.zhimg.com/50/v2-ff6b755da6a5ae4c6556177fcb1f9d12_hd.jpg",
                "http://tupian.qqjay.com/tou2/2018/1210/545e977a488d942d8c0305a7a7e57e1f.jpg"
              ],
              receiverType: ReceiverType.RED_PACKAGE,
              onTap: (){

              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _pcLoginView(){
    return Container(
      height: ScreenUtil.getInstance().setHeight(80),
      padding: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(30),
        right: ScreenUtil.getInstance().setWidth(30)
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffE1E1E1),
            width: ScreenUtil.getInstance().setWidth(1)
          )
        )
      ),
      width: double.infinity,
      child:Row(
        children: <Widget>[
          LoadAssetSvg(
            "icons_outlined_display",
            width: ScreenUtil.getInstance().setWidth(43),
            color: Color(0xff828282),
          ),
          SizedBox(
            width: ScreenUtil.getInstance().setWidth(15),
          ),
          Text(
            "Windows 微信已登录，手机通知已关闭",
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(30),
              color: Color(0xff828282),
            ),
          )
        ],
      )
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}
