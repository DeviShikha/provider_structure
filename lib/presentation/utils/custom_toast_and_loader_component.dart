// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get_structure/core/app_config/my_app.dart';
// import 'package:get_structure/presentation/utils/loader_view.dart';
// import 'package:get_structure/presentation/utils/toast_view.dart';
//
// /// Manages a global loader overlay with responsive positioning and safe overlay handling.
// class CustomLoaderMessage {
//   static OverlayEntry? _overlayEntry;
//
//   /// Displays a loader overlay with the specified [isPrimary] style.
//   /// Removes any existing loader before showing a new one.
//   static void showLoader(bool isPrimary) {
//     if (navigatorKey.currentState == null || navigatorKey.currentState!.overlay == null) {
//       return; // Exit if navigator or overlay is not available
//     }
//
//     hideLoader(); // Ensure any existing loader is removed
//
//     _overlayEntry = OverlayEntry(
//       builder: (context) => Positioned(
//         top: 50.h, // Responsive top position
//         left: 0.1.sw, // 10% of screen width
//         width: 0.8.sw, // 80% of screen width
//         child: LottieLoader(
//           height: 100.h,
//           width: 100.h,
//           isPrimary: isPrimary,
//         ),
//       ),
//     );
//
//     navigatorKey.currentState!.overlay!.insert(_overlayEntry!);
//   }
//
//   /// Hides the currently displayed loader, if any.
//   static void hideLoader() {
//     _overlayEntry?.remove();
//     _overlayEntry = null; // Reset to avoid dangling references
//   }
// }
//
// /// Manages a global toast overlay with auto-dismissal and responsive positioning.
// class CustomToastMessage {
//   static OverlayEntry? _overlayEntry;
//
//   /// Displays a toast with the specified [message] and [type].
//   /// Automatically dismisses after 3 seconds.
//   static void showToast(String message, ToastType type) {
//     if (navigatorKey.currentState == null || navigatorKey.currentState!.overlay == null) {
//       return; // Exit if navigator or overlay is not available
//     }
//
//     hideToast(); // Ensure any existing toast is removed
//
//     _overlayEntry = OverlayEntry(
//       builder: (context) => Positioned(
//         top: 50.h, // Responsive top position
//         left: 0.1.sw, // 10% of screen width
//         width: 0.8.sw, // 80% of screen width
//         child: SlideToast(
//           message,
//           type: type,
//           onDismissed: () {
//             hideToast();
//           },
//         ),
//       ),
//     );
//
//     navigatorKey.currentState!.overlay!.insert(_overlayEntry!);
//
//     // Auto-dismiss after 3 seconds
//     Future.delayed(const Duration(seconds: 3), () {
//       hideToast();
//     });
//   }
//
//   /// Hides the currently displayed toast, if any.
//   static void hideToast() {
//     _overlayEntry?.remove();
//     _overlayEntry = null; // Reset to avoid dangling references
//   }
// }