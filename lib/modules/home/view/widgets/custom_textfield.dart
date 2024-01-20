import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtime_innovation_assignment/utils/colors.dart';
import 'package:realtime_innovation_assignment/utils/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.onChanged,
    this.inputFormatters,
    this.autofocus,
    this.prefixIcon,
    this.width,
    this.height,
    this.prefix,
    this.hintTextColor,
  }) : super(key: key);
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool? autofocus;
  final Widget? prefixIcon;
  final double? width;
  final double? height;

  final Widget? prefix;
  final Color? hintTextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40.h,
      width: width ?? MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: Colors.white,
        border: Border.all(
          color: borderColor,
          width: 1.w,
        ),
      ),
      child: Center(
        child: TextFormField(
          style: headingStyle.copyWith(fontSize: 14.sp),
          inputFormatters: inputFormatters,
          autofocus: autofocus ?? false,
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefix: prefixIcon,
            prefixIcon: prefix,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(color: Colors.transparent, width: 1.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(color: Colors.transparent, width: 1.w),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(color: Colors.transparent, width: 1.w),
            ),
            hintText: hintText,
            hintStyle: subHeadingStyle.copyWith(
              color: hintTextColor,
            ),
            contentPadding: EdgeInsets.only(left: 5.w),
          ),
        ),
      ),
    );
  }
}
