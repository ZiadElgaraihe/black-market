import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserDataTextFormField extends StatefulWidget {
  const UserDataTextFormField({
    super.key,
    this.controller,
    required this.enabled,
    required this.hintText,
    required this.keyboardType,
    required this.obscureText,
    this.onSaved,
    required this.suffixIcon,
    this.validator,
  });

  final TextEditingController? controller;
  final bool enabled;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final void Function(String? newValue)? onSaved;
  final String suffixIcon;
  final String? Function(String? value)? validator;

  @override
  State<UserDataTextFormField> createState() => _UserDataTextFormFieldState();
}

class _UserDataTextFormFieldState extends State<UserDataTextFormField> {
  final FocusNode _focusNode = FocusNode();
  final ValueNotifier<bool> _isFocued = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _hasError = ValueNotifier<bool>(false);

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
      controller: widget.controller,
      focusNode: _focusNode,
      enabled: widget.enabled,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      style: TextStyles.textStyle12.copyWith(
        fontWeight: FontWeight.w400,
      ),
      cursorColor: AppColors.yellow,
      onSaved: widget.onSaved,
      validator: (widget.validator == null)
          ? (value) {
              if (value == null || value.isEmpty) {
                _hasError.value = true;
                return 'هذا الحقل مطلوب';
              }
              _hasError.value = false;
              return null;
            }
          : (value) {
              String? customError = widget.validator!(value);
              _hasError.value = customError != null;
              return customError;
            },
      decoration: InputDecoration(
        hintText: widget.hintText,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 15.h,
        ),
        errorStyle: TextStyles.textStyle8,
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
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 0.5.w),
          borderRadius: BorderRadius.circular(8.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 0.5.w),
          borderRadius: BorderRadius.circular(8.w),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 15.h,
          ),
          child: ValueListenableBuilder(
            valueListenable: _hasError,
            builder: (context, hasError, child) => ValueListenableBuilder(
              valueListenable: _isFocued,
              builder: (context, isFocused, child) => SvgPicture.asset(
                widget.suffixIcon,
                height: 22.h,
                width: 22.w,
                colorFilter: ColorFilter.mode(
                  hasError
                      ? AppColors.red
                      : isFocused
                          ? AppColors.yellow
                          : AppColors.white,
                  BlendMode.srcATop,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
