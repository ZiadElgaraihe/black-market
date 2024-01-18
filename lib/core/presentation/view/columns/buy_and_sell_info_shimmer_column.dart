import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/core/presentation/view/containers/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyAndSellInfoShimmerColumn extends StatelessWidget {
  const BuyAndSellInfoShimmerColumn({
    super.key,
    required this.title,
    required this.titleColor,
    this.highlightColor,
    this.baseColor,
  });

  final String title;
  final Color titleColor;
  final Color? highlightColor;
  final Color? baseColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyles.textStyle10.copyWith(
            color: titleColor,
          ),
        ),
        ShimmerContainer(
          width: 55.w,
          highlightColor: highlightColor,
          baseColor: baseColor,
        ),
      ],
    );
  }
}
