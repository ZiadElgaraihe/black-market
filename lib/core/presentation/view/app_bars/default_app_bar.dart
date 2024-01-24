import 'package:black_market/core/presentation/view/buttons/default_back_button.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    required this.title,
    this.canPop = true,
    this.backButtonBackgroundColor,
  });

  final Color? backButtonBackgroundColor;
  final String title;
  final bool canPop;

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Row(
          children: [
            if (canPop)
              DefaultBackButton(
                backButtonBackgroundColor: backButtonBackgroundColor,
              ),
            Spacer(flex: (canPop) ? 2 : 3),
            Text(
              title,
              style: TextStyles.textStyle18,
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
