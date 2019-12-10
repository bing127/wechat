import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:wechat_app/common/android_back_desktop.dart';
import 'package:wechat_app/common/loadAssetSvg.dart';
import 'package:wechat_app/common/utils.dart';

import 'package:wechat_app/page/home/page/home_page.dart';
import 'package:wechat_app/page/contact/page/contact_page.dart';
import 'package:wechat_app/page/find/page/find_page.dart';
import 'package:wechat_app/page/my/page/my_page.dart';

class AppMain extends StatefulWidget {
  @override
  _AppMainState createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  List<Widget> _pageList = new List();
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() {
    _pageList = [
      HomePage(),
      ContactPage(),
      FindPage(),
      MyPage(),
    ];
  }


  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AndroidBackTop.backDeskTop(); //设置为返回不退出app
        return false; //一定要return false
      },
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: _pageList,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Utils.getBackgroundColor(context),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon:_badgeIcon(
                  icon: "icons_outlined_chats",
                  count: "66",
                ),
                activeIcon:_badgeIcon(
                  icon: "icons_filled_chats",
                  count: "66",
                  isActive: true
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    '微信',
                    key: Key('微信'),
                  ),
                )
            ),
            BottomNavigationBarItem(
                icon:_badgeIcon(
                    icon: "icons_outlined_contacts",
                    count: "1",
                    show: false
                ),
                activeIcon:_badgeIcon(
                    icon: "icons_filled_contacts",
                    count: "1",
                    isActive: true,
                    show: false
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    '通讯录',
                    key: Key('通讯录'),
                  ),
                )
            ),
            BottomNavigationBarItem(
                icon:const LoadAssetSvg('icons_outlined_discover',color:const Color(0xff111111)),
                activeIcon:const LoadAssetSvg('icons_filled_discover',color:const Color(0xff07c160)),
                title: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    '发现',
                    key: Key('发现'),
                  ),
                )
            ),
            BottomNavigationBarItem(
                icon:const LoadAssetSvg('icons_outlined_me',color:const Color(0xff111111)),
                activeIcon:const LoadAssetSvg('icons_filled_me',color:const Color(0xff07c160)),
                title: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    '我的',
                    key: Key('我的'),
                  ),
                )
            )
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          elevation: 5.0,
          iconSize: 21.0,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          unselectedIconTheme: IconThemeData(
            color: Color(0xff111111)
          ),
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Color(0xff111111),
          onTap: (index) {
            _pageController.jumpToPage(index);
          },
        ),
      ),
    );
  }


  Widget _badgeIcon({ String icon,String count:"1",bool show:true ,bool isActive:false}){
    return Badge(
      badgeContent: Text(
        "$count",
        style: TextStyle(
            color: const Color(0xffffffff),
            fontSize: 12
        ),
      ),
      elevation: 0,
      showBadge: show,
      padding: EdgeInsets.all(int.parse(count) > 9 ? 3 : 5),
      animationDuration: Duration(milliseconds: 0),
      child: LoadAssetSvg('$icon',color:Color( isActive ? 0xff07c160 : 0xff111111) ),
      position: BadgePosition(
        top: -3,
        right: -7
      ),

    );
  }
}
