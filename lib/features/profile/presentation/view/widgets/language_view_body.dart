import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/profile/presentation/view/widgets/containers/radio_button_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageViewBody extends StatefulWidget {
  const LanguageViewBody({super.key});

  @override
  State<LanguageViewBody> createState() => _LanguageViewBodyState();
}

class _LanguageViewBodyState extends State<LanguageViewBody> {
  final ValueNotifier<String> _currentLanguage = ValueNotifier<String>('ar');

  @override
  void dispose() {
    _currentLanguage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: ValueListenableBuilder(
        valueListenable: _currentLanguage,
        builder: (context, currentLanguage, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Text(
              'حدد اللغة',
              style: TextStyles.textStyle16,
            ),
            SizedBox(height: 12.h),
            RadioButtonContainer(
              groupValue: currentLanguage,
              onChanged: (value) {
                _currentLanguage.value = value! as String;
              },
              title: 'العربية',
              value: 'ar',
            ),
            RadioButtonContainer(
              groupValue: currentLanguage,
              onChanged: (value) {
                _currentLanguage.value = value! as String;
              },
              title: 'الإنجليزية',
              value: 'en',
            ),
          ],
        ),
      ),
    );
  }
}
