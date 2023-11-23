import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RememberMeRow extends StatefulWidget {
  const RememberMeRow({super.key});

  @override
  State<RememberMeRow> createState() => _RememberMeRowState();
}

class _RememberMeRowState extends State<RememberMeRow> {
  final ValueNotifier<bool> _rememberMe = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 2,
          child: ValueListenableBuilder(
            valueListenable: _rememberMe,
            builder: (context, rememberMe, child) => Checkbox(
              shape: const CircleBorder(),
              side: BorderSide(color: AppColors.white, width: 0.75.w),
              fillColor: MaterialStatePropertyAll(AppColors.backgroundColor),
              value: rememberMe,
              onChanged: (value) {
                _rememberMe.value = value!;
              },
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Text('تذكرني', style: TextStyles.textStyle14),
      ],
    );
  }
}
