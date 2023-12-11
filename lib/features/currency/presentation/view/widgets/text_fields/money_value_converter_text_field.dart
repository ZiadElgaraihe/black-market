import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoneyValueConverterTextField extends StatelessWidget {
  const MoneyValueConverterTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      style: TextStyles.textStyle8.copyWith(
        fontWeight: FontWeight.w400,
      ),
      cursorColor: AppColors.yellow,
      decoration: InputDecoration(
        hintText: 'أدخل المبلغ',
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkGrey,
            width: 0.5.w,
          ),
          borderRadius: BorderRadius.circular(6.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.yellow, width: 0.5.w),
          borderRadius: BorderRadius.circular(6.w),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 0.5.w),
          borderRadius: BorderRadius.circular(6.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 0.5.w),
          borderRadius: BorderRadius.circular(6.w),
        ),
        constraints: BoxConstraints(
          minHeight: 40.h,
          maxWidth: 147.w,
        ),
        suffixIconConstraints: BoxConstraints(minHeight: 40.h),
        suffixIcon: Container(
          height: 35.h,
          width: 37.w,
          decoration: BoxDecoration(
            color: AppColors.yellow,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(6.w),
            ),
          ),
          child: Material(
            color: AppColors.transparent,
            child: InkWell(
              onTap: () {},
              splashColor: AppColors.gold,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(6.w),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'حساب',
                  style: TextStyles.textStyle8.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
