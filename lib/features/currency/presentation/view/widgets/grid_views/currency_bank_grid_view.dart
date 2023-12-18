import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyBankGridView extends StatelessWidget {
  const CurrencyBankGridView({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
  });

  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;

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
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
