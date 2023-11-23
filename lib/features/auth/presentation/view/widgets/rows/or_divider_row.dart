import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OrDividerRow extends StatelessWidget {
  const OrDividerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32.h),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1.5.h,
              endIndent: 23.99.w,
            ),
          ),
          Text(
            'أو',
            style: GoogleFonts.tajawal(
              textStyle: TextStyles.textStyle12.copyWith(
                color: AppColors.lightYellow,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 1.5.h,
              indent: 23.99.w,
            ),
          ),
        ],
      ),
    );
  }
}
