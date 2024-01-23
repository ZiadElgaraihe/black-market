import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/buttons/default_button.dart';
import 'package:black_market/core/presentation/view/sections/user_data_section.dart';
import 'package:black_market/core/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({
    super.key,
    required this.canEditValueNotifier,
  });

  final ValueNotifier<bool> canEditValueNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: canEditValueNotifier,
      builder: (context, canEdit, child) => SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            Container(
              height: 110.h,
              width: 110.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2.w,
                  color: AppColors.darkGrey,
                ),
              ),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: context.read<AppCubit>().userModel!.user.avatar,
                  errorWidget: (context, url, error) {
                    return Icon(
                      Icons.person_rounded,
                      color: AppColors.darkGrey,
                      size: 44.w,
                    );
                  },
                  progressIndicatorBuilder: (context, url, progress) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 13.5.w,
                        vertical: 10.h,
                      ),
                      child: CircularProgressIndicator(
                        color: AppColors.darkGrey,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 8.h),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStatePropertyAll(
                  AppColors.green.withOpacity(0.1),
                ),
              ),
              onPressed: canEdit ? () {} : null,
              child: Text(
                Tr.of(context).changePhoto,
                style: TextStyles.textStyle10.copyWith(
                  color: AppColors.green.withOpacity(canEdit ? 1 : 0.5),
                ),
              ),
            ),
            SizedBox(height: 37.h),
            UserDataSection(
              controller: TextEditingController(
                text: context.read<AppCubit>().userModel!.user.name,
              ),
              enabled: canEdit,
              hintText: Tr.of(context).enterFullName,
              keyboardType: TextInputType.name,
              obscureText: false,
              sectionTitle: Tr.of(context).fullName,
              suffixIcon: AppIcons.assetsIconsProfile,
            ),
            SizedBox(height: 28.h),
            UserDataSection(
              controller: TextEditingController(
                text: context.read<AppCubit>().userModel!.user.email,
              ),
              enabled: canEdit,
              hintText: Tr.of(context).enterEmail,
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              sectionTitle: Tr.of(context).email,
              suffixIcon: AppIcons.assetsIconsMessage,
            ),
            SizedBox(height: 216.h),
            DefaultButton(
              backgroundColor:
                  !canEdit ? AppColors.yellow.withOpacity(0.5) : null,
              onPressed: canEdit ? () {} : null,
              title: Tr.of(context).change,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
