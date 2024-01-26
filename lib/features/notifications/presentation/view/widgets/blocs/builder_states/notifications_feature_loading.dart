import 'package:black_market/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationsFeatureLoading extends StatelessWidget {
  const NotificationsFeatureLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.yellow,
      ),
    );
  }
}
