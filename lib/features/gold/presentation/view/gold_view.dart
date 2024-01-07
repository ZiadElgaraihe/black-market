import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/helpers/dio_helper.dart';
import 'package:black_market/core/utils/service_locator.dart';
import 'package:black_market/features/gold/data/repos/gold_repo.dart';
import 'package:black_market/features/gold/presentation/view/widgets/gold_view_app_bar.dart';
import 'package:black_market/features/gold/presentation/view/widgets/gold_view_body.dart';
import 'package:black_market/features/gold/presentation/view_model/get_gold_data_cubit/get_gold_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoldView extends StatelessWidget {
  const GoldView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetGoldDataCubit>(
      create: (context) => GetGoldDataCubit(
        connectionServices: getIt<ConnectionServices>(),
        goldServices: GoldServices(
          dioHelper: getIt<DioHelper>(),
        ),
      ),
      child: const Scaffold(
        appBar: GoldViewAppBar(),
        body: GoldViewBody(),
      ),
    );
  }
}
