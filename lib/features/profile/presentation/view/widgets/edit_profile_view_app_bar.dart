import 'package:black_market/core/presentation/view/buttons/default_back_button.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/profile/presentation/view/widgets/buttons/edit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileViewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const EditProfileViewAppBar({
    super.key,
    required this.onEditTapped,
    required this.title,
  });

  final void Function() onEditTapped;
  final String title;

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Row(
          children: [
            const DefaultBackButton(),
            const Spacer(),
            Text(
              title,
              style: TextStyles.textStyle18,
            ),
            const Spacer(),
            EditButton(
              onTap: onEditTapped,
            ),
          ],
        ),
      ),
    );
  }
}
