import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../core/constants/app_colors.dart';


class LottieLoader extends StatelessWidget {
  final double? height, width;
  final bool isPrimary;

  const LottieLoader(
      {super.key, required this.isPrimary, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return PopScope(
      canPop: false,
      child: Container(
        color: Colors.transparent,
        height: size.height,
        width: size.width,
        child: Center(
          child: Container(
            height: 64.h,
            width: 64.h,
            decoration: BoxDecoration(
                color: isPrimary
                    ? theme.secondaryHeaderColor
                    : theme.primaryColor,
                borderRadius: BorderRadius.circular(8.r)),
            child: SpinKitCircle(
              color: isPrimary
                  ? theme.primaryColor
                  : AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
