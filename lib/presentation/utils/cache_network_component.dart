import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CachedNetwork extends StatelessWidget {
  final String imageUrl;
  final double? imgHeight;
  final double? imgWidth;
  final BoxFit imgFit;
  final double borderRadius;
  final Widget? placeHolderWidget;

  const CachedNetwork({
    Key? key,
    required this.imageUrl,
    this.imgHeight,
    this.imgWidth,
    this.imgFit = BoxFit.cover,
    this.borderRadius = 6.0,
    this.placeHolderWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = imgHeight ?? 42.h;
    final double width = imgWidth ?? 42.w;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius.r),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
        fit: imgFit,
        placeholder: (context, url) => SizedBox(
          height: height,
          width: width,
          child: Center(
            child: placeHolderWidget ??
                SizedBox(
                  height: 20.r,
                  width: 20.r,
                  child: const CircularProgressIndicator(strokeWidth: 2),
                ),
          ),
        ),
        errorWidget: (context, url, error) => SizedBox(
          height: height,
          width: width,
          child: Icon(
            Icons.error_outline_rounded,
            size: 24.r,
            color: Colors.grey.shade600,
          ),
        ),
      ),
    );
  }
}
