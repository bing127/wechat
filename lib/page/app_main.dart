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
  List<String> _appBarTitles = ['微信', '通讯录', '发现', '我的'];
  final PageController _pageController = PageController();
  List<BottomNavigationBarItem> _list;
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

  List<BottomNavigationBarItem> _buildBottomNavigationBarItem() {
    if (_list == null) {
      List _tabImages = [
        [
          const LoadAssetSvg('icons_outlined_chats',color:const Color(0xff111111)),
          const LoadAssetSvg('icons_filled_chats',color:const Color(0xff07c160)),
        ],
        [
          const LoadAssetSvg('icons_outlined_contacts',color:const Color(0xff111111)),
          const LoadAssetSvg('icons_filled_contacts',color:const Color(0xff07c160)),
        ],
        [
          const LoadAssetSvg('icons_outlined_discover',color:const Color(0xff111111)),
          const LoadAssetSvg('icons_filled_discover',color:const Color(0xff07c160)),
        ],
        [
          const LoadAssetSvg('icons_outlined_me',color:const Color(0xff111111)),
          const LoadAssetSvg('icons_filled_me',color:const Color(0xff07c160)),
        ]
      ];
      _list = List.generate(4, (i) {
        return BottomNavigationBarItem(
            icon: _tabImages[i][0],
            activeIcon: _tabImages[i][1],
            title: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                _appBarTitles[i],
                key: Key(_appBarTitles[i]),
              ),
            )
        );
      });
    }
    return _list;
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
          items: _buildBottomNavigationBarItem(),
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
}
