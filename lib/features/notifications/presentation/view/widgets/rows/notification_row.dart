import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/notifications/data/models/notification_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationRow extends StatelessWidget {
  const NotificationRow({
    super.key,
    required this.notification,
  });

  final NotificationModel notification;

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
              errorWidget: (context, url, error) {
                return const Placeholder();
              },
              progressIndicatorBuilder: (context, url, progress) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 13.5.w,
                    vertical: 10.h,
                  ),
                  child: CircularProgressIndicator(
                    color: AppColors.white,
                  ),
                );
              },
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
                  notification.title,
                  style: TextStyles.textStyle11,
                ),
                SizedBox(height: 6.h),
                Text(
                  notification.body,
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
