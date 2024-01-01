import 'package:black_market/features/gold/presentation/view/widgets/tiles/gold_list_item_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldIconsSection extends StatelessWidget {
  const GoldIconsSection({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> icons = <String>[
      'ربع جنيه -  2 جرام',
      'نص جنيه -  4 جرام',
      'جنيه -  8 جرام',
    ];
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      physics: const BouncingScrollPhysics(),
      itemCount: icons.length,
      itemBuilder: (context, index) => GoldListItemExpansionTile(
        title: icons[index],
      ),
      separatorBuilder: (context, index) => SizedBox(height: 18.h),
    );
  }
}
