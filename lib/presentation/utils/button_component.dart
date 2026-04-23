import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider_structure/presentation/utils/svg_icon_component.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/presentation_constants.dart';


/// Common button component for project
class ButtonComponent extends StatelessWidget {
  final String btnText;
  final Function()? onBtnPressed;
  final Color btnColor;
  final bool invertBtnColor;
  final bool minimizeSize;
  final String? prefixIcon;
  final String? postfixIcon;
  final Color btnTextColor;
  final Color iconClr;
  final List<BoxShadow>? boxShadow;
  final TextStyle? buttonTextStyle;
  final EdgeInsets padding;
  final double borderRadius;

  const ButtonComponent(
      this.btnText, {
        super.key,
        this.onBtnPressed,
        this.btnColor = AppColors.primaryColor,
        this.invertBtnColor = false,
        this.minimizeSize = false,
        this.prefixIcon,
        this.postfixIcon,
        this.btnTextColor = AppColors.whiteColor,
        this.iconClr = AppColors.whiteColor,
        this.boxShadow,
        this.buttonTextStyle,
        this.padding = const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 30,
        ),
        this.borderRadius = 40,
      });

  @override
  Widget build(BuildContext context) {
    final disabled = onBtnPressed == null;

    return InkWell(
      onTap: onBtnPressed,
      splashColor: AppColors.greyishThree,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: disabled
              ? AppColors.disable
              : invertBtnColor
              ? btnColor.withValues(alpha: PresentationConstant.btnOpacity)
              : btnColor,
          boxShadow: boxShadow,
        ),
        alignment: minimizeSize ? null : Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null)
              Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: SvgIconComponent(
                  icon: prefixIcon!,
                  height: 16.h,
                  width: 16.h,
                  color: iconClr,
                ),
              ),
            Text(
              btnText,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: buttonTextStyle?.copyWith(
                color: disabled
                    ? btnTextColor.withValues(alpha: 0.6)
                    : btnTextColor,
              ) ??
                  TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: disabled
                        ? btnTextColor.withValues(alpha: 0.6)
                        : btnTextColor,
                  ),
            ),
            if (postfixIcon != null)
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: SvgIconComponent(
                  icon: postfixIcon!,
                  height: 16.h,
                  width: 16.h,
                  color: iconClr,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
