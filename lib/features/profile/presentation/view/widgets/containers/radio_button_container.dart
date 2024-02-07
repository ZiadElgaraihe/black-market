import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/constants.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RadioButtonContainer extends StatelessWidget {
  const RadioButtonContainer({
    super.key,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    required this.value,
  });

  final Object groupValue;
  final void Function(Object? value) onChanged;
  final String title;
  final Object value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17.5.w, vertical: 21.h),
      margin: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyles.textStyle14,
          ),
          Transform.scale(
            scale: isTablet ? 1.5 : 1,
            child: Radio(
              activeColor: AppColors.yellow,
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
