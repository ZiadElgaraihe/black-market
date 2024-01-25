import 'package:black_market/features/notifications/presentation/view/widgets/columns/notifications_date_section_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsSection extends StatelessWidget {
  const NotificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      itemCount: 3,
      itemBuilder: (context, index) => const NotificationsDateSectionColumn(
        date: '24 يناير 2024',
      ),
    );
  }
}
