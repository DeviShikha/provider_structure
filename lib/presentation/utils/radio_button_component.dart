import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';

class RadioButtonComponent<T> extends StatelessWidget {
  final String title;
  final T value;
  final T groupValue;
  final ValueChanged<T?> onChange;
  final TextStyle? textStyle;
  final double size;
  final Color? activeColor;

  const RadioButtonComponent({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChange,
    this.textStyle,
    this.size = 20,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6.r),
      onTap: () => onChange(value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: Radio<T>(
              value: value,
              groupValue: groupValue,
              onChanged: onChange,
              visualDensity: const VisualDensity(
                vertical: VisualDensity.minimumDensity,
                horizontal: VisualDensity.minimumDensity,
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: activeColor ?? AppColors.successColor,
            ),
          ),
          10.h.verticalSpace,
          Expanded(
            child: Text(
              title,
              style: textStyle ??
                  Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 16.sp),
            ),
          ),
        ],
      ),
    );
  }
}
