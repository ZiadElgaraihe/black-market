import 'package:black_market/core/animations/side_slide_transition.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/buttons/default_button.dart';
import 'package:black_market/core/presentation/view/containers/grid_view_item_container.dart';
import 'package:black_market/core/presentation/view/grid_views/default_grid_view.dart';
import 'package:black_market/core/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:black_market/core/presentation/view_model/favourite_cubit/favourite_cubit.dart';
import 'package:black_market/features/auth/presentation/view/log_in_view.dart';
import 'package:black_market/features/currency/presentation/view/widgets/columns/currency_bank_item_content_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return (context.read<AppCubit>().userModel == null)
        ? Center(
            child: DefaultButton(
              onPressed: () {
                Navigator.push(
                  context,
                  SideSlideTransition(
                    page: const LogInView(),
                  ),
                );
              },
              width: 150.w,
              title: Tr.of(context).logIn,
            ),
          )
        : BlocBuilder<FavouriteCubit, FavouriteState>(
            builder: (context, state) {
              return FutureBuilder(
                future: context.read<FavouriteCubit>().getFavourite(),
                builder: (context, snapshot) => DefaultGridView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  physics: const BouncingScrollPhysics(),
                  itemCount:
                      context.read<FavouriteCubit>().favouriteData.length,
                  itemBuilder: (context, index) => GridViewItemContainer(
                    child: CurrencyBankItemContentColumn(
                      bankPrice:
                          context.read<FavouriteCubit>().favouriteData[index],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
