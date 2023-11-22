import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserDataTextFormField extends StatefulWidget {
  const UserDataTextFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    required this.obscureText,
    required this.suffixIcon,
  });

  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String suffixIcon;

  @override
  State<UserDataTextFormField> createState() => _UserDataTextFormFieldState();
}

class _UserDataTextFormFieldState extends State<UserDataTextFormField> {
  final FocusNode _focusNode = FocusNode();
  final ValueNotifier<bool> _isFocued = ValueNotifier<bool>(false);

  @override
  void initState() {
    _focusNode.addListener(() {
      _isFocued.value = _focusNode.hasFocus;
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _isFocued.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      style: TextStyles.textStyle12.copyWith(
        fontWeight: FontWeight.w400,
      ),
      cursorColor: AppColors.yellow,
      decoration: InputDecoration(
        hintText: widget.hintText,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 15.h,
        ),
        filled: true,
        fillColor: AppColors.darkGrey,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.yellow, width: 0.5.w),
          borderRadius: BorderRadius.circular(8.w),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 15.h,
          ),
          child: ValueListenableBuilder(
            valueListenable: _isFocued,
            builder: (context, isFocused, child) => SvgPicture.asset(
              widget.suffixIcon,
              height: 22.h,
              width: 22.w,
              colorFilter: ColorFilter.mode(
                isFocused ? AppColors.yellow : AppColors.white,
                BlendMode.srcATop,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
