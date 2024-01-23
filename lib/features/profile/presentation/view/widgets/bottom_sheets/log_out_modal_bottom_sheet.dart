import 'package:black_market/core/data/services/local_database_services.dart';
import 'package:black_market/core/data/services/secure_database_services.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/service_locator.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/profile/data/repos/log_out_repo.dart';
import 'package:black_market/features/profile/presentation/view/widgets/blocs/log_out_bloc_consumer.dart';
import 'package:black_market/features/profile/presentation/view_model/log_out_cubit/log_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogOutModalBottomSheet extends StatelessWidget {
  const LogOutModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogOutCubit>(
      create: (context) => LogOutCubit(
        appCubit: context.read<AppCubit>(),
        logOutServices: LogOutServices(
          localDatabaseServices: getIt<LocalDatabaseServices>(),
          secureDatabaseServices:  getIt<SecureDatabaseServices>(),
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: 16.h,
          right: 24.w,
          bottom: 35.h,
          left: 24.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(32.w),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 5.h,
              width: 36.w,
              decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(16.w),
              ),
            ),
            SizedBox(height: 57.h),
            Text(
              Tr.of(context).areYouSureToLogOut,
              style: TextStyles.textStyle18.copyWith(
                color: AppColors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 31.h,
              ),
              child: SvgPicture.asset(
                AppIcons.assetsIconsWarningIcon,
                height: 125.h,
                width: 125.w,
                colorFilter: ColorFilter.mode(
                  AppColors.red,
                  BlendMode.srcATop,
                ),
              ),
            ),
            Divider(thickness: 2.h),
            SizedBox(height: 31.h),
            const LogOutBlocConsumer(),
          ],
        ),
      ),
    );
  }
}
