import 'package:black_market/core/functions/show_alert_dialog.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/alert_dialogs/result_alert_dialog.dart';
import 'package:black_market/features/notifications/data/models/notification_model.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/dividers/date_divider.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/rows/notification_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationsDateSectionColumn extends StatelessWidget {
  const NotificationsDateSectionColumn({
    super.key,
    required this.date,
    required this.notifications,
  });

  final String date;
  final List<NotificationModel> notifications;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateDivider(
          date: date,
        ),
        Column(
          children: List.generate(
            notifications.length,
            (index) => InkWell(
              onTap: (notifications[index].link != null)
                  ? () async {
                      await _launchNotificationLink(context, index);
                    }
                  : null,
              borderRadius: BorderRadius.circular(14.w),
              child: NotificationRow(
                notification: notifications[index],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _launchNotificationLink(BuildContext context, int index) async {
    Uri uri = Uri.parse(notifications[index].link!);
    if (!await launchUrl(uri)) {
      if (!context.mounted) return;
      showAlertDialog(
        context,
        child: ResultAlertDialog(
          buttonTitle: Tr.of(context).cancel,
          message: Tr.of(context).cannotLaunchThisUrl,
          onPressed: () {
            Navigator.pop(context);
          },
          title: Tr.of(context).failure,
        ),
      );
    }
  }
}
