import 'package:black_market/features/currency/presentation/view/widgets/containers/currency_bank_item_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyBankSection extends StatelessWidget {
  const CurrencyBankSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(right: 24.w, left: 24.w, bottom: 20.h),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 20.h,
      ),
      itemCount: 7,
      itemBuilder: (context, index) => CurrencyBankItemContainer(index: index),
    );
  }
}
