import 'package:black_market/core/presentation/view/containers/grid_view_item_container.dart';
import 'package:black_market/core/presentation/view/grid_views/default_grid_view.dart';
import 'package:black_market/features/currency/data/models/currency_price_model/currency_price_model.dart';
import 'package:black_market/features/currency/presentation/view/widgets/columns/currency_bank_item_content_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    CurrencyPriceModel currencyPriceModel = CurrencyPriceModel(
            id: 1,
            bankId: 1,
            buyPrice: 30.24,
            price: 30.75,
            sellPrice: 31.25,
            updatedAt: 'updatedAt',
          );
      currencyPriceModel.bankName = 'بنك مصر';
    return DefaultGridView(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      physics: const BouncingScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) => GridViewItemContainer(
        child: CurrencyBankItemContentColumn(
          index: index,
          bankPrice: currencyPriceModel,
        ),
      ),
    );
  }
}
