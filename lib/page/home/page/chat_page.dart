import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wechat_app/common/loadAssetSvg.dart';
import 'package:wechat_app/components/custom_field.dart';


class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _textEditingController = new TextEditingController();
  double _keyboardHeight = 0.0;
  String _inputContent;
  FocusNode _focusNode = new FocusNode();


  // 键盘 icons_outlined_keyboard
  // 删除 icons_outlined_delete_emoji
  // 加号 icons_outlined_add2
  // 笑脸 icons_outlined_sticker


  @override
  void initState() {
    _focusNode.addListener((){
      if(!_focusNode.hasFocus){
        setState(() {
          _keyboardHeight = 0;
        });
      }
    });
    super.initState();
  }


  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: false)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "张三",
          style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(36),
              fontWeight: FontWeight.w600
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: LoadAssetSvg(
              "icons_outlined_more",
            ),
            onPressed: (){

            },
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[

              ],
            ),
            Positioned(
              child: _panel(),
              left: 0,
              right: 0,
              bottom: 0,
            )
          ],
        )
      ),
    );
  }

  Widget _panel(){
    return Container(
      color: Color(0xffF7F7F7),
      padding: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(20),
        right: ScreenUtil.getInstance().setWidth(20)
      ),
      child: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              _iconBtn("icons_outlined_voice"),
              Expanded(
                flex: 1,
                child: PhysicalModel(
                  color: Colors.transparent,
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(ScreenUtil.getInstance().setWidth(10)),
                  child: Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil.getInstance().setHeight(15),
                        bottom: ScreenUtil.getInstance().setHeight(15),
                        left: ScreenUtil.getInstance().setWidth(10),
                        right: ScreenUtil.getInstance().setWidth(10)
                    ),
                    color: Colors.white,
                    child: CustomField(
                      controller: _textEditingController,
                      maxLength: 300,
                      hintText: "",
                      leadingPadding: 10,
                      focusNode: _focusNode,
                      change: (val){
                        print("内容：$val");
                        setState(() {
                          _inputContent = val;
                        });
                      },
                    ),
                  ),
                ),
              ),
              _iconBtn("icons_outlined_sticker",onTap: (){
                _focusNode.unfocus();
                setState(() {
                  _keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
                });
              }),
              SizedBox(
                width: ScreenUtil.getInstance().setWidth(10),
              ),
              AnimatedSwitcher(
                  transitionBuilder: (child, anim){
                    return ScaleTransition(child: child,scale: anim);
                  },
                  duration: Duration(milliseconds: 300),
                  child: (_inputContent!= null && _inputContent.length>0 ) ? _sendBtn() : _iconBtn("icons_outlined_add2")
              ),
            ],
          ),
          Container(
           height: _keyboardHeight,
           width: double.infinity,
           child: Text("1"),
            color: Colors.red,
          )
        ],
      ),
    );
  }

  Widget _iconBtn(String icon,{ GestureTapCallback onTap }){
    return Container(
      color: Colors.transparent,
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: LoadAssetSvg(
            "$icon",
            width: ScreenUtil.getInstance().setWidth(60),
          ),
        ),
      ),
    );
  }

  Widget _sendBtn(){
    return Container(
      width: ScreenUtil.getInstance().setWidth(120),
      height: ScreenUtil.getInstance().setWidth(60),
      child: Material(
        color: Color(0xff07c160),
        borderRadius: BorderRadius.circular(ScreenUtil.getInstance().setWidth(5)),
        child: InkWell(
          onTap: (){
            
          },
          child: Container(
            alignment: Alignment.center,
            child: Text(
                "发送",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white
                ),
            ),
          )
        ),
      ),
    );
  }
}
