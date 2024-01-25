import 'package:black_market/features/notifications/presentation/view/widgets/dividers/date_divider.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/rows/notification_row.dart';
import 'package:flutter/material.dart';

class NotificationsDateSectionColumn extends StatelessWidget {
  const NotificationsDateSectionColumn({
    super.key,
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateDivider(
          date: date,
        ),
        Column(
          children: List.generate(
            5,
            (index) => const NotificationRow(),
          ),
        ),
      ],
    );
  }
}
