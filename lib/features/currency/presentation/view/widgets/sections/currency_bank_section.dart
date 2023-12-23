import 'package:black_market/core/animations/left_slide_transition.dart';
import 'package:black_market/features/currency/presentation/view/bank_view.dart';
import 'package:black_market/features/currency/presentation/view/widgets/columns/currency_bank_item_content_column.dart';
import 'package:black_market/features/currency/presentation/view/widgets/columns/currency_bank_item_shimmer_column.dart';
import 'package:black_market/features/currency/presentation/view/widgets/containers/currency_bank_item_container.dart';
import 'package:black_market/features/currency/presentation/view/widgets/grid_views/currency_bank_grid_view.dart';
import 'package:black_market/features/currency/presentation/view_model/currency_latest/currency_latest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        if (state is CurrencyLatestLoading) {
          return CurrencyBankGridView(
            itemCount: 10,
            itemBuilder: (context, index) => const CurrencyBankItemContainer(
              child: CurrencyBankItemShimmerColumn(),
            ),
          );
        } else if (state is CurrencyLatestSuccess) {
          return CurrencyBankGridView(
            itemCount: state.currencies[currentIndex].bankPrices.length,
            itemBuilder: (context, index) => CurrencyBankItemContainer(
              onTap: () {
                Navigator.push(
                  context,
                  RightSlideTransition(
                    page: BankView(
                      bankId: state.currencies[currentIndex].bankPrices[index].bankId!,
                      currencies: state.currencies,
                      currencyIndex: currentIndex,
                    ),
                  ),
                );
              },
              child: CurrencyBankItemContentColumn(
                index: index,
                bankPrice: state.currencies[currentIndex].bankPrices[index],
              ),
            ),
          );
        } else if (state is CurrencyLatestFailure) {
          return CurrencyBankGridView(
            itemCount:
                (state.currencies != null) ? state.currencies!.length : 10,
            itemBuilder: (context, index) => CurrencyBankItemContainer(
              onTap: (state.currencies != null)
                  ? () {
                      Navigator.push(
                        context,
                        RightSlideTransition(
                          page: BankView(
                            bankId:
                                state.currencies![currentIndex].bankPrices[index].bankId!,
                            currencies: state.currencies!,
                            currencyIndex: currentIndex,
                          ),
                        ),
                      );
                    }
                  : null,
              child: CurrencyBankItemContentColumn(
                index: index,
                bankPrice: state.currencies?[currentIndex].bankPrices[index],
              ),
            ),
          );
        } else {
          return CurrencyBankGridView(
            itemCount: 10,
            itemBuilder: (context, index) => CurrencyBankItemContainer(
              child: CurrencyBankItemContentColumn(index: index),
            ),
          );
        }
      },
    );
  }
}
