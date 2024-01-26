import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class NotificationsFeatureFailure extends StatelessWidget {
  const NotificationsFeatureFailure({
    super.key,
    required this.onRefresh,
  });

  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.yellow,
      child: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.38,
          ),
          Center(
            child: Text(
              'لا توجد بيانات لعرضها',
              style: TextStyles.textStyle14.copyWith(
                color: AppColors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
