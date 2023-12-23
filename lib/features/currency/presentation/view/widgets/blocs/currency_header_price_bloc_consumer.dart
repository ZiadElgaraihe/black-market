import 'package:black_market/core/functions/show_alert_dialog.dart';
import 'package:black_market/core/presentation/view/alert_dialogs/result_alert_dialog.dart';
import 'package:black_market/features/currency/presentation/view/widgets/columns/currency_header_price_content_column.dart';
import 'package:black_market/features/currency/presentation/view/widgets/columns/currency_header_price_shimmer_column.dart';
import 'package:black_market/features/currency/presentation/view_model/currency_latest/currency_latest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyHeaderPriceBlocConsumer extends StatelessWidget {
  const CurrencyHeaderPriceBlocConsumer({
    super.key,
    required this.currentIndexValueNotifier,
  });

  final ValueNotifier<int> currentIndexValueNotifier;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrencyLatestCubit, CurrencyLatestState>(
      listener: _listener,
      builder: (context, state) {
        if (state is CurrencyLatestLoading) {
          return const CurrencyHeaderPriceShimmerColumn();
        } else if (state is CurrencyLatestSuccess) {
          return CurrencyHeaderPriceContentColumn(
            currencies: state.currencies,
            currentIndexValueNotifier: currentIndexValueNotifier,
          );
        } else if (state is CurrencyLatestFailure) {
          return CurrencyHeaderPriceContentColumn(
            currencies: state.currencies,
            currentIndexValueNotifier: currentIndexValueNotifier,
          );
        } else {
          return CurrencyHeaderPriceContentColumn(
            currentIndexValueNotifier: currentIndexValueNotifier,
          );
        }
      },
    );
  }

  void _listener(context, state) {
    if (state is CurrencyLatestFailure) {
      showAlertDialog(
        context,
        child: ResultAlertDialog(
          buttonTitle: 'Cancel',
          message: state.errMessage,
          onPressed: () {
            Navigator.pop(context);
          },
          title: 'Failure',
        ),
      );
    }
  }
}
