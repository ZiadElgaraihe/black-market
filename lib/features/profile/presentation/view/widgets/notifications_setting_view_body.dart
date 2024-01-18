import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/profile/presentation/view/widgets/rows/notification_setting_switch_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsSettingViewBody extends StatelessWidget {
  const NotificationsSettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          Text(
            Tr.of(context).notifications,
            style: TextStyles.textStyle16,
          ),
          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
              borderRadius: BorderRadius.circular(18.w),
            ),
            child: Column(
              children: [
                NotificationSettingSwitchRow(title: Tr.of(context).currencies),
                Divider(thickness: 0.5.h),
                NotificationSettingSwitchRow(title: Tr.of(context).gold),
                Divider(thickness: 0.5.h),
                NotificationSettingSwitchRow(title: Tr.of(context).news),
              ],
            ),
          )
        ],
      ),
    );
  }
}
