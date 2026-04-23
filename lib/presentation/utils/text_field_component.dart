import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';

/// Common Textfield for all project components
class TextFieldComponent extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final bool isPassword;
  final bool isRequired;
  final String? Function(String?)? validator;
  final Function(String newValue)? onChanged;
  final TextInputType keyboardType;
  final int? maxLength;
  final dynamic suffixIcon;
  final Function()? onSuffixPressed;
  final Widget? prefixWidget;
  final Color fillColor;
  final bool enlargePrfixWidget;
  final Color labelColor;
  final bool readOnly;
  final bool enabled;
  final int? maxLines;
  final VoidCallback? onTap;
  final FocusNode currentFocus;
  final FocusNode? nextFocus;
  final EdgeInsetsGeometry? padding;
  final bool isLabel;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final List<TextInputFormatter>? formatter;
  final TextAlign textAlign;
  final Color focusBorderColor;
  final double borderRadius;
  final void Function()? passOnTap;

  const TextFieldComponent(
      this.controller, {
        super.key,
        this.hintText,
        this.labelText,
        this.isPassword = false,
        this.isRequired = false,
        this.validator,
        this.onChanged,
        this.keyboardType = TextInputType.text,
        this.maxLength = 45,
        this.suffixIcon,
        this.onSuffixPressed,
        this.prefixWidget,
        this.onTap,
        this.fillColor = AppColors.whiteColor,
        this.enlargePrfixWidget = false,
        this.labelColor = AppColors.charcoalGrey,
        this.readOnly = false,
        this.enabled = true,
        this.maxLines,
        required this.currentFocus,
        this.nextFocus,
        this.padding,
        this.isLabel = true,
        this.hintTextStyle,
        this.textStyle,
        this.formatter,
        this.textAlign = TextAlign.start,
        this.focusBorderColor = AppColors.blackColor,
        this.borderRadius = 8.0,
        this.passOnTap,
      });

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return widget.isLabel
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _showLabelText(context),
        4.h.verticalSpace,
        Center(child: _textField(context)),
      ],
    )
        : _textField(context);
  }

  Widget _textField(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines ?? 1,
      controller: widget.controller,
      readOnly: widget.readOnly,
      focusNode: widget.currentFocus,
      cursorColor: Colors.black,
      enabled: widget.enabled,
      obscureText: widget.isPassword ? hidePassword : false,
      maxLength: widget.maxLength,
      textInputAction: widget.keyboardType == TextInputType.multiline
          ? TextInputAction.newline
          : widget.nextFocus != null
          ? TextInputAction.next
          : TextInputAction.done,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      onEditingComplete: () {
        widget.currentFocus.unfocus();
        if (widget.nextFocus != null) {
          widget.nextFocus?.requestFocus();
        }
      },
      style: widget.textStyle ??
          Theme.of(context).textTheme.labelSmall?.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.blackColor,
          ),
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.formatter,
      textAlign: widget.textAlign,
      decoration: InputDecoration(
        errorStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
          fontSize: 14.sp,
          color: AppColors.redOrange,
          fontWeight: FontWeight.w500,
        ),
        counterText: '',
        filled: true,
        errorMaxLines: 2,
        fillColor: widget.fillColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.focusBorderColor),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.focusBorderColor),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.focusBorderColor),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.redOrange),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.redOrange),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        contentPadding: widget.padding ??
            EdgeInsetsDirectional.only(
              start: 16,
              top: 16,
              bottom: 15,
              end: widget.suffixIcon != null ? 0 : 16,
            ),
        border: InputBorder.none,
        hintText: widget.hintText ?? '',
        hintStyle: widget.hintTextStyle ??
            Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: 14.sp,
              color: AppColors.greyColor.withValues(alpha: 0.6),
              fontWeight: FontWeight.w500,
            ),
        prefixIcon: widget.prefixWidget != null
            ? SizedBox(
          width: widget.enlargePrfixWidget ? 102 : null,
          child: widget.prefixWidget,
        )
            : null,
        suffixIcon: widget.isPassword
            ? GestureDetector(
          child: Icon(
            hidePassword ? Icons.visibility_off : Icons.visibility,
            color: AppColors.greyishThree,
          ),
          onTap: () {
            if (widget.passOnTap != null) {
              widget.passOnTap!();
            } else {
              setState(() => hidePassword = !hidePassword);
            }
          },
        )
            : widget.suffixIcon != null && widget.onSuffixPressed != null
            ? GestureDetector(
          onTap: widget.onSuffixPressed,
          child: widget.suffixIcon is IconData
              ? Icon(
            widget.suffixIcon,
            color: AppColors.greyishThree,
          )
              : widget.suffixIcon,
        )
            : null,
      ),
    );
  }

  Widget _showLabelText(BuildContext context) {
    if (widget.labelText != null) {
      return Row(
        children: [
          Text(
            widget.labelText!,
            maxLines: 2,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: widget.labelColor,
            ),
          ),
          Text(
            widget.isRequired ? '*' : '',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: widget.labelColor,
            ),
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
