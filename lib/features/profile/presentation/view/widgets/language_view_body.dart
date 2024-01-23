import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view_model/localization_cubit/localization_cubit.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/profile/presentation/view/widgets/containers/radio_button_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageViewBody extends StatefulWidget {
  const LanguageViewBody({super.key});

  @override
  State<LanguageViewBody> createState() => _LanguageViewBodyState();
}

class _LanguageViewBodyState extends State<LanguageViewBody> {
  late final ValueNotifier<String> _currentLanguage;
  late List<Map<String, String>> _languagesData;

  @override
  void initState() {
    _currentLanguage = ValueNotifier<String>(
      context.read<LocalizationCubit>().appLocale.languageCode,
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _languagesData = [
      {
        'language_title': Tr.of(context).arabic,
        'language_code':
            context.read<LocalizationCubit>().supportedLanguages[0],
      },
      {
        'language_title': Tr.of(context).english,
        'language_code':
            context.read<LocalizationCubit>().supportedLanguages[1],
      },
    ];
    super.didChangeDependencies();
  }

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
              Tr.of(context).selectLanguage,
              style: TextStyles.textStyle16,
            ),
            SizedBox(height: 12.h),
            Column(
              children: List.generate(
                _languagesData.length,
                (index) => RadioButtonContainer(
                  groupValue: currentLanguage,
                  onChanged: (value) {
                    _currentLanguage.value = value! as String;
                    context.read<LocalizationCubit>().changeCurrentLanguage(
                          languageCode: value as String,
                        );
                  },
                  title: _languagesData[index]['language_title'] as String,
                  value: _languagesData[index]['language_code'] as String,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
