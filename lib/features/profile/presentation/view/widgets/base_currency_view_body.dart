import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/profile/presentation/view/widgets/containers/radio_button_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseCurrencyViewBody extends StatelessWidget {
  const BaseCurrencyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          Text(
            Tr.of(context).selectTheBaseCurrency,
            style: TextStyles.textStyle16,
          ),
          SizedBox(height: 12.h),
          RadioButtonContainer(
            groupValue: 'egp',
            onChanged: (value) {},
            title:
                '${Tr.of(context).egyptianPound} / ${Tr.of(context).egyptianPoundAbbreviation}',
            value: 'egp',
          ),
        ],
      ),
    );
  }
}
