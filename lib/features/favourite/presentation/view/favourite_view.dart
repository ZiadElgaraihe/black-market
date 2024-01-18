import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/app_bars/default_app_bar.dart';
import 'package:black_market/features/favourite/presentation/view/widgets/favourite_view_body.dart';
import 'package:flutter/material.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: Tr.of(context).favourite,
        canPop: false,
      ),
      body: const FavouriteViewBody(),
    );
  }
}
