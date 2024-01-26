import 'package:black_market/core/functions/show_alert_dialog.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/alert_dialogs/result_alert_dialog.dart';
import 'package:black_market/core/presentation/view_model/localization_cubit/localization_cubit.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/columns/notifications_date_section_column.dart';
import 'package:black_market/features/notifications/presentation/view_model/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class GetNotificationsBlocConsumer extends StatelessWidget {
  const GetNotificationsBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    GetNotificationsCubit cubit = context.read<GetNotificationsCubit>();
    return BlocConsumer<GetNotificationsCubit, GetNotificationsState>(
      listener: _listener,
      builder: (context, state) {
        if (state is GetNotificationsLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.yellow,
            ),
          );
        } else if (state is GetNotificationsSuccess ||
            cubit.notificationsMap != null) {
          return RefreshIndicator(
            onRefresh: () async {
              cubit.getNotifications(isRefresh: true);
            },
            color: AppColors.yellow,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount: cubit.notificationsMap!.keys.length,
              itemBuilder: (context, index) => NotificationsDateSectionColumn(
                date: _modifyDateFormat(
                  context,
                  cubit.notificationsMap!.keys.toList()[index],
                ),
                notifications: cubit.notificationsMap!.values.toList()[index],
              ),
            ),
          );
        } else {
          return Center(
            child: Text(
              'لا توجد بيانات لعرضها',
              style: TextStyles.textStyle14.copyWith(
                color: AppColors.grey,
              ),
            ),
          );
        }
      },
    );
  }

  void _listener(context, state) {
    if (state is GetNotificationsFailure) {
      showAlertDialog(
        context,
        child: ResultAlertDialog(
          buttonTitle: Tr.of(context).cancel,
          message: state.errMessage,
          onPressed: () {
            Navigator.pop(context);
          },
          title: Tr.of(context).failure,
        ),
      );
    }
  }

  //modify date format from (25-01-2024) to (25 Jan 2024)
  String _modifyDateFormat(BuildContext context, String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat(
      'dd MMM yyyy',
      context.read<LocalizationCubit>().appLocale.languageCode,
    ).format(dateTime);
  }
}
