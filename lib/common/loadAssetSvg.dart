import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LoadAssetSvg extends StatelessWidget {
  const LoadAssetSvg(this.svg,{
    Key key,
    this.width:25.0,
    this.color
  }): super(key: key);

  final double width;
  final String svg;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svg/$svg.svg',
      width: width,
      color: color,
    );
  }
}
