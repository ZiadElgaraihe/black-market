import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/core/presentation/view/text_fields/user_data_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDataSection extends StatelessWidget {
  const UserDataSection({
    super.key,
    required this.hintText,
    required this.keyboardType,
    required this.obscureText,
    required this.sectionTitle,
    required this.suffixIcon,
  });

  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String sectionTitle;
  final String suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 16.w),
          child: Text(
            sectionTitle,
            style: TextStyles.textStyle14,
          ),
        ),
        SizedBox(height: 12.h),
        UserDataTextFormField(
          keyboardType: keyboardType,
          obscureText: obscureText,
          hintText: hintText,
          suffixIcon: suffixIcon,
        ),
      ],
    );
  }
}
