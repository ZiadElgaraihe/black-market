import 'package:black_market/features/gold/presentation/view/widgets/tiles/gold_list_item_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldBarsSection extends StatelessWidget {
  const GoldBarsSection({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> bars = <String>[
      '1جرام',
      '5جرام',
      '10جرام',
      '20جرام',
      '50جرام',
    ];
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      physics: const BouncingScrollPhysics(),
      itemCount: bars.length,
      itemBuilder: (context, index) => GoldListItemExpansionTile(
        title: bars[index],
      ),
      separatorBuilder: (context, index) => SizedBox(height: 18.h),
    );
  }
}
