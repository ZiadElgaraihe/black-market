import 'package:black_market/core/animations/bottom_slide_transition.dart';
import 'package:black_market/core/functions/show_alert_dialog.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/buttons/default_button.dart';
import 'package:black_market/core/presentation/view/buttons/default_loading_button.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/navbar/presentation/view/nav_bar_view.dart';
import 'package:black_market/features/profile/presentation/view_model/log_out_cubit/log_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogOutBlocConsumer extends StatelessWidget {
  const LogOutBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogOutCubit, LogOutState>(
      listener: _listener,
      builder: (context, state) {
        if (state is LogOutLoading) {
          return DefaultLoadingButton(
            backgroundColor: AppColors.red,
            progressIndicatorColor: AppColors.white,
            width: 180.w,
          );
        } else {
          return DefaultButton(
            backgroundColor: AppColors.red,
            textColor: AppColors.white,
            width: 180.w,
            onPressed: () {
              context.read<LogOutCubit>().logOut();
            },
            title: Tr.of(context).logOut,
          );
        }
      },
    );
  }

  void _listener(context, state) {
    if (state is LogOutLoading) {
      showAlertDialog(
        context,
        canDismiss: false,
        barrierColor: AppColors.transparent,
        child: const AlertDialog(),
      );
    } else if (state is LogOutSuccess) {
      Navigator.pushAndRemoveUntil(
        context,
        BottomSlideTransition(
          page: const NavBarView(),
        ),
        (route) => false,
      );
    }
  }
}
