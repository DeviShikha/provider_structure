import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';

class CheckBoxComponent extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool?> onChange;
  final TextStyle? textStyle;

  const CheckBoxComponent({
    super.key,
    required this.title,
    required this.value,
    required this.onChange,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChange(!value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 20.h,
            height: 20.h,
            child: Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              value: value,
              onChanged: onChange,
              activeColor: AppColors.successColor,
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
