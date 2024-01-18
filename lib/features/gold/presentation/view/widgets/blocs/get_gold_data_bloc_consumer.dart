import 'package:black_market/core/functions/show_alert_dialog.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/alert_dialogs/result_alert_dialog.dart';
import 'package:black_market/core/presentation/view/columns/grid_view_item_shimmer_column.dart';
import 'package:black_market/core/presentation/view/containers/grid_view_item_container.dart';
import 'package:black_market/core/presentation/view/grid_views/default_grid_view.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/gold/presentation/view/widgets/columns/gold_item_content_column.dart';
import 'package:black_market/features/gold/presentation/view_model/get_gold_data_cubit/get_gold_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetGoldDataBlocConsumer extends StatelessWidget {
  const GetGoldDataBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetGoldDataCubit, GetGoldDataState>(
      listener: _listener,
      builder: (context, state) {
        if (state is GetGoldDataLoading) {
          return DefaultGridView(
            padding: EdgeInsets.only(
              top: 12.h,
              right: 24.w,
              bottom: 20.h,
              left: 24.w,
            ),
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemCount: 10,
            itemBuilder: (context, index) => const GridViewItemContainer(
              child: GridViewItemShimmerColumn(
                containTwoActionButtons: false,
              ),
            ),
          );
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<GetGoldDataCubit>().getGoldData(isRefresh: true);
            },
            color: AppColors.yellow,
            child: DefaultGridView(
              padding: EdgeInsets.only(
                top: 12.h,
                right: 24.w,
                bottom: 20.h,
                left: 24.w,
              ),
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount: context.read<GetGoldDataCubit>().golds?.length ?? 10,
              itemBuilder: (context, index) => GridViewItemContainer(
                child: GoldItemContentColumn(
                  gold: context.read<GetGoldDataCubit>().golds?[index],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  void _listener(context, state) {
    if (state is GetGoldDataFailure) {
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
