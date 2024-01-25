import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationRow extends StatelessWidget {
  const NotificationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.w),
            child: CachedNetworkImage(
              imageUrl:
                  'http://www.voipsys.space/storage/settings/March2023/eqXjF0gwhXjBlyi4zXED.jpg',
              height: 48.h,
              width: 48.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.w),
          SizedBox(
            width: 263.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'بنك فرنسي: دولار السوق السوداء في مصر سيواصل صعودة',
                  style: TextStyles.textStyle11,
                ),
                SizedBox(height: 6.h),
                Text(
                  'لقد تم صعود الجنيه المصري',
                  style: TextStyles.textStyle10.copyWith(
                    color: AppColors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
