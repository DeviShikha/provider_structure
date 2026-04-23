import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Svg picture component for projects
class SvgIconComponent extends StatelessWidget {
  final String icon;
  final double height;
  final double width;
  final Color? color;
  final BoxFit fit;
  final String? semanticsLabel;

  const SvgIconComponent({
    Key? key,
    required this.icon,
    this.height = 24,
    this.width = 24,
    this.color,
    this.fit = BoxFit.contain,
    this.semanticsLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      height: height,
      width: width,
      fit: fit,
      semanticsLabel: semanticsLabel,
      // colorFilter: color != null
      //     ? ColorFilter.mode(color!, BlendMode.srcIn)
      //     : null,
    );
  }
}
