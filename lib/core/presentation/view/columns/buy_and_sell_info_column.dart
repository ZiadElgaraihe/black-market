import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class BuyAndSellInfoColumn extends StatelessWidget {
  const BuyAndSellInfoColumn({
    super.key,
    required this.title,
    required this.titleColor,
    required this.value,
    required this.valueColor,
  });

  final String title;
  final Color titleColor;
  final String value;
  final Color valueColor;

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
        Text(
          value,
          style: TextStyles.textStyle10.copyWith(
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
