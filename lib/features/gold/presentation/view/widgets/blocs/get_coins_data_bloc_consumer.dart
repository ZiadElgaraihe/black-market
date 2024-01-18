import 'package:black_market/core/functions/show_alert_dialog.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/alert_dialogs/result_alert_dialog.dart';
import 'package:black_market/core/presentation/view/containers/shimmer_container.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/gold/presentation/view/widgets/tiles/gold_list_item_expansion_tile.dart';
import 'package:black_market/features/gold/presentation/view_model/get_ingots_coins_data_cubit/get_ingots_coins_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetCoinsDataBlocConsumer extends StatelessWidget {
  const GetCoinsDataBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    GetIngotsCoinsDataCubit getIngotsCoinsDataCubit =
        context.read<GetIngotsCoinsDataCubit>();
    return BlocConsumer<GetIngotsCoinsDataCubit, GetIngotsCoinsDataState>(
      listener: _listener,
      builder: (context, state) {
        if (state is GetIngotsCoinsDataLoading) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) => ShimmerContainer(
              baseColor: AppColors.darkGrey,
              height: 65.h,
              highlightColor: AppColors.grey,
              raduis: 10.w,
              width: double.infinity,
            ),
            separatorBuilder: (context, index) => SizedBox(height: 18.h),
          );
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              context
                  .read<GetIngotsCoinsDataCubit>()
                  .getIngotsCoinsData(isRefresh: true);
            },
            color: AppColors.yellow,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount: getIngotsCoinsDataCubit.goldenCoins?.length ?? 4,
              itemBuilder: (context, index) => GoldListItemExpansionTile(
                isCoin: true,
                weight: getIngotsCoinsDataCubit.goldenCoins?[index].weight,
                company: getIngotsCoinsDataCubit
                    .goldenCoins?[index].companies.firstOrNull,
                price: getIngotsCoinsDataCubit.goldenCoins?[index].price,
              ),
              separatorBuilder: (context, index) => SizedBox(height: 18.h),
            ),
          );
        }
      },
    );
  }

  void _listener(context, state) {
      if (state is GetIngotsCoinsDataFailure) {
        showAlertDialog(
          context,
          child: ResultAlertDialog(
            buttonTitle: Tr.of(context).cancel,
            message: state.errMessage,
            onPressed: () {
              Navigator.pop(context);
            },
            title: Tr.of(context).failure,
          ),
        );
      }
    }
}
