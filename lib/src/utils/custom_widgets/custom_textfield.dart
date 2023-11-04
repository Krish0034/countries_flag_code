
import 'package:countries_flag_code/src/utils/colors_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? text;
  final double? height;
  final double? width;
  final TextStyle? hinTextStyle;
  final TextStyle? textStyle;
  final TextStyle? errorTextStyle;
  final TextInputType? textInputType;
  final Color? backgroundColor;
  final Widget? suffixIcon;
  final double? borderRadius;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool readOnly;
  final bool needInputFormatters;
  final EdgeInsets? contentPadding;
  final Widget? prefixIcon;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;
  final Function()? onTap;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final TextCapitalization? textCapitalization;
  final String? Function(String?)? validator;
  final BorderRadius? borderChange;
  final Color? borderColor;
  final Color? iconColor;
  final TextInputAction? textInputAction;

  const CustomTextField({
    super.key,
    this.controller,
    this.onChange,
    this.hintText,
    this.text,
    this.textInputType,
    this.obscureText,
    this.height,
    this.hinTextStyle,
    this.textStyle,
    this.width,
    this.onTap,
    this.iconColor,
    this.readOnly = false,
    this.needInputFormatters = false,
    this.validator,
    this.errorText,
    this.inputFormatters,
    this.onSubmitted,
    this.backgroundColor,
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.textInputAction,
    this.contentPadding,
    this.errorTextStyle,
    this.borderChange,
    this.textCapitalization,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textStyle,
      onTap: onTap,
      maxLines: maxLines ?? 1,
      minLines: minLines ?? 1,
      maxLength: maxLength ?? 20,
      textCapitalization: textCapitalization ?? TextCapitalization.sentences,
      readOnly: readOnly,
      keyboardType: textInputType,
      controller: controller,
      onChanged: onChange,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      obscureText: obscureText ?? false,
      inputFormatters:
          needInputFormatters == true ? null : inputFormatters ?? [],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: ColorFiles.appBarText,
      textInputAction: textInputAction ?? TextInputAction.done,
      initialValue: text,
      decoration: InputDecoration(
        counterText: '',
        suffixIcon: suffixIcon,
        suffixIconColor: iconColor ?? ColorFiles.appBarText,
        contentPadding:
            contentPadding ?? EdgeInsets.fromLTRB(20.w, 10.h, 10.w, 0.h),
        prefixIcon: prefixIcon,
        errorText: errorText,
        hintText: hintText,
        filled: true,
        fillColor: backgroundColor ?? ColorFiles.whiteColor,
        hintStyle: hinTextStyle,
        errorStyle: errorTextStyle,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5.w,
            color: borderColor ?? ColorFiles.appBarText,
          ), //<-- SEE HERE
          borderRadius:
              borderChange ?? BorderRadius.circular(borderRadius ?? 50.0.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5.w,
            color: borderColor ?? ColorFiles.appBarText,
          ), //<-- SEE HERE
          borderRadius:
              borderChange ?? BorderRadius.circular(borderRadius ?? 50.0.r),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5.w,
            color: borderColor ?? ColorFiles.appBarText,
          ), //<-- SEE HERE
          borderRadius:
              borderChange ?? BorderRadius.circular(borderRadius ?? 50.0.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5.w,
            color: borderColor ?? ColorFiles.appBarText,
          ), //<-- SEE HERE
          borderRadius:
              borderChange ?? BorderRadius.circular(borderRadius ?? 50.0.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5.w,
            color: borderColor ?? ColorFiles.appBarText,
          ), //<-- SEE HERE
          borderRadius:
              borderChange ?? BorderRadius.circular(borderRadius ?? 50.0.r),
        ),
      ),
    );
  }
}
