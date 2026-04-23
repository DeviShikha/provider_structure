import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';


enum ToastType { success, error, info }

class SlideToast extends StatefulWidget {
  final String message;
  final ToastType type;
  final IconData? customIcon;
  final bool showIcon;
  final Duration toastDuration;
  final VoidCallback onDismissed;

  const SlideToast(
      this.message, {
        super.key,
        required this.type,
        required this.onDismissed,
        this.customIcon,
        this.showIcon = true,
        this.toastDuration = const Duration(seconds: 3),
      });

  @override
  _SlideToastState createState() => _SlideToastState();
}

class _SlideToastState extends State<SlideToast> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();

    // Auto-dismiss toast after duration
    Future.delayed(widget.toastDuration).then((_) {
      if (mounted) {
        _controller.reverse().then((_) {
          widget.onDismissed();
        });
      }
    });
  }

  Color _getBackgroundColor(BuildContext context) {
    switch (widget.type) {
      case ToastType.success:
        return Theme.of(context).primaryColor;
      case ToastType.error:
        return AppColors.dangerColor;
      case ToastType.info:
        return AppColorsExtension.infoColor;
    }
  }

  Color _getForegroundColor(Color backgroundColor) {
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black : AppColors.whiteColor;
  }

  IconData _getDefaultIcon() {
    switch (widget.type) {
      case ToastType.success:
        return Icons.check_circle;
      case ToastType.error:
        return Icons.error;
      case ToastType.info:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _getBackgroundColor(context);
    final foregroundColor = _getForegroundColor(backgroundColor);

    return Semantics(
      label: '${widget.type.toString().split('.').last} toast: ${widget.message}',
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Container(
            width: 0.8.sw, // Responsive width (80% of screen width)
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            margin: EdgeInsets.symmetric(horizontal: 0.1.sw), // Center horizontally
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 6.r,
                  offset: Offset(0, 2.h),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.showIcon) ...[
                  Icon(
                    widget.customIcon ?? _getDefaultIcon(),
                    color: foregroundColor,
                    size: 24.sp,
                  ),
                  12.w.horizontalSpace,
                ],
                Expanded(
                  child: Text(
                    widget.message,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: foregroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// Optional: Define infoColor if not already in AppColors
extension AppColorsExtension on AppColors {
  static Color get infoColor => Colors.blueGrey;
}