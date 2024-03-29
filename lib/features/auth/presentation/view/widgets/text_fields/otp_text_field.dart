import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({
    super.key,
    required this.index,
    required this.otpValueNotifier,
  });

  final int index;
  final ValueNotifier<String> otpValueNotifier;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      showCursor: false,
      style: GoogleFonts.plusJakartaSans(
        textStyle: TextStyles.textStyle18.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.pastelBlue,
        ),
      ),
      textAlign: TextAlign.center,
      maxLength: 1,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'\d')),
      ],
      onSaved: (newValue) {
        otpValueNotifier.value += newValue!;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Tr.of(context).thisFieldIsRequired;
        }
        return null;
      },
      onChanged: (value) {
        if (value.length == 1 && index <= 3) {
          if (index != 3) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).unfocus();
          }
        } else if (value.isEmpty && index >= 0) {
          if (index != 0) {
            FocusScope.of(context).previousFocus();
          } else {
            FocusScope.of(context).unfocus();
          }
        }
      },
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.symmetric(vertical: 19.5.h),
        filled: true,
        fillColor: AppColors.darkGrey,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.yellow,
            width: 0.5.w,
          ),
          borderRadius: BorderRadius.circular(10.w),
        ),
      ),
    );
  }
}
