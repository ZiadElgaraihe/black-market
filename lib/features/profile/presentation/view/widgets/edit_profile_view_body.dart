import 'package:black_market/core/presentation/view/buttons/default_button.dart';
import 'package:black_market/core/presentation/view/sections/user_data_section.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
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
        padding: EdgeInsets.only(right: 24.w, bottom: 20.h, left: 24.w),
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
              child: Icon(
                Icons.person_rounded,
                color: AppColors.darkGrey,
                size: 44.w,
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
                'تغيير الصورة',
                style: TextStyles.textStyle10.copyWith(
                  color: AppColors.green.withOpacity(canEdit ? 1 : 0.5),
                ),
              ),
            ),
            SizedBox(height: 37.h),
            UserDataSection(
              controller: TextEditingController(text: 'علي عبدالله'),
              enabled: canEdit,
              hintText: 'أدخل الاسم بالكامل',
              keyboardType: TextInputType.name,
              obscureText: false,
              sectionTitle: 'الاسم بالكامل',
              
              suffixIcon: AppIcons.assetsIconsProfile,
            ),
            SizedBox(height: 28.h),
            UserDataSection(
              controller: TextEditingController(text: 'aliatwan02@gmail.com'),
              enabled: canEdit,
              hintText: 'أدخل البريد الإلكتروني',
              keyboardType: TextInputType.visiblePassword,
              obscureText: false,
              sectionTitle: 'البريد الإلكتروني',
              suffixIcon: AppIcons.assetsIconsMessage,
            ),
            SizedBox(height: 216.h),
            DefaultButton(
              backgroundColor:
                  !canEdit ? AppColors.yellow.withOpacity(0.5) : null,
              onPressed: canEdit ? () {} : null,
              title: 'تعديل',
            ),
          ],
        ),
      ),
    );
  }
}