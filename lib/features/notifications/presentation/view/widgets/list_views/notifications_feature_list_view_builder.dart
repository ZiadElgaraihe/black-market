import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsFeatureListViewBuilder extends StatelessWidget {
  const NotificationsFeatureListViewBuilder({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.scrollController,
  });

  final ScrollController? scrollController;
  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
