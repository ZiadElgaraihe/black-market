import 'package:black_market/core/presentation/view/containers/grid_view_item_container.dart';
import 'package:black_market/core/presentation/view/grid_views/default_grid_view.dart';
import 'package:black_market/features/gold/presentation/view/widgets/columns/gold_item_content_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldSection extends StatelessWidget {
  const GoldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultGridView(
      padding: EdgeInsets.only(
        top: 12.h,
        right: 24.w,
        bottom: 20.h,
        left: 24.w,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) => const GridViewItemContainer(
        child: GoldItemContentColumn(),
      ),
    );
  }
}
