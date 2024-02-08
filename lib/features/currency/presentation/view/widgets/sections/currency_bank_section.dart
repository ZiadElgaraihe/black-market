import 'package:black_market/core/animations/side_slide_transition.dart';
import 'package:black_market/core/presentation/view/columns/grid_view_item_shimmer_column.dart';
import 'package:black_market/core/presentation/view/containers/grid_view_item_container.dart';
import 'package:black_market/core/presentation/view/grid_views/default_grid_view.dart';
import 'package:black_market/core/presentation/view_model/favourite_cubit/favourite_cubit.dart';
import 'package:black_market/features/currency/presentation/view/bank_view.dart';
import 'package:black_market/features/currency/presentation/view/widgets/columns/currency_bank_item_content_column.dart';
import 'package:black_market/features/currency/presentation/view_model/currency_latest_cubit/currency_latest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyBankSection extends StatelessWidget {
  const CurrencyBankSection({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyLatestCubit, CurrencyLatestState>(
      builder: (context, state) {
        CurrencyLatestCubit cubit = context.read<CurrencyLatestCubit>();
        if (state is CurrencyLatestLoading) {
          return DefaultGridView(
            padding: EdgeInsets.only(right: 24.w, left: 24.w, bottom: 20.h),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) => const GridViewItemContainer(
              child: GridViewItemShimmerColumn(containTwoActionButtons: true),
            ),
          );
        } else {
          return DefaultGridView(
            padding: EdgeInsets.only(right: 24.w, left: 24.w, bottom: 20.h),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: cubit.currencies?[currentIndex].bankPrices.length ?? 10,
            itemBuilder: (context, index) => GridViewItemContainer(
              onTap: () {
                if (cubit.currencies != null) {
                  Navigator.push(
                    context,
                    SideSlideTransition(
                      page: BankView(
                        bankId: cubit.currencies![currentIndex]
                            .bankPrices[index].bankId!,
                        currencies: cubit.currencies!,
                        currencyIndex: currentIndex,
                      ),
                    ),
                  );
                }
              },
              child: FutureBuilder(
                future: context.read<FavouriteCubit>().getFavourite(),
                builder: (context, snapshot) => CurrencyBankItemContentColumn(
                  bankPrice: cubit.currencies?[currentIndex].bankPrices[index],
                  currencyName: cubit.currencies?[currentIndex].name,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
