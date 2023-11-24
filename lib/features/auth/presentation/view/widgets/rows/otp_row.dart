import 'package:black_market/features/auth/presentation/view/widgets/text_fields/otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpRow extends StatelessWidget {
  const OtpRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          4,
          (index) => SizedBox(
            width: 65.w,
            child: OtpTextField(index: index),
          ),
        ),
      ),
    );
  }
}
