import 'package:black_market/features/notifications/presentation/view/widgets/blocs/get_notifictions_bloc_consumer.dart';
import 'package:black_market/features/notifications/presentation/view_model/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsSection extends StatelessWidget {
  const NotificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<GetNotificationsCubit>().getNotifications(),
      builder: (context, snapshot) => const GetNotificationsBlocConsumer(),
    );
  }
}
