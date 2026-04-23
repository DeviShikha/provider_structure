import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/presentation_constants.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;
  final Widget? appBar;
  final Widget? bottomNavigationBar;
  final double appBarHeight;
  final Color backgroundColor;
  final String? backgroundImage;
  final bool resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Widget? drawer;
  final bool isBodyHasSafeArea;
  final EdgeInsets safeAreaPadding;
  final Future<void> Function(bool, Object?)? onPopInvoked;

  const MainScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.appBarHeight = PresentationConstant.appBarHeightSixty,
    this.backgroundColor = AppColors.whiteColor,
    this.backgroundImage,
    this.resizeToAvoidBottomInset = true,
    this.floatingActionButton,
    this.scaffoldKey,
    this.drawer,
    this.isBodyHasSafeArea = true,
    this.safeAreaPadding = const EdgeInsets.all(0),
    this.onPopInvoked,
  });

  BoxDecoration _buildBackgroundDecoration() {
    return backgroundImage != null
        ? BoxDecoration(
      image: DecorationImage(
        image: AssetImage(backgroundImage!),
        fit: BoxFit.cover,
      ),
    )
        : const BoxDecoration();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: onPopInvoked == null, // Allow pop by default if no callback
      onPopInvokedWithResult: onPopInvoked ?? (didPop, result) async {
      },
      child: Container(
        decoration: _buildBackgroundDecoration(),
        child: Scaffold(
          backgroundColor: backgroundImage != null
              ? AppColors.transparentColor
              : backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          key: scaffoldKey,
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
          appBar: appBar != null
              ? PreferredSize(
            preferredSize: Size(
              double.infinity,
              appBarHeight.h, // Use responsive height
            ),
            child: appBar!,
          )
              : null,
          drawer: scaffoldKey != null && drawer != null ? drawer : null,
          body: isBodyHasSafeArea
              ? SafeArea(
            top: safeAreaPadding.top > 0,
            bottom: safeAreaPadding.bottom > 0,
            left: safeAreaPadding.left > 0,
            right: safeAreaPadding.right > 0,
            child: body,
          )
              : body,
        ),
      ),
    );
  }
}