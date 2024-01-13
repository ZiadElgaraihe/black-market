import 'package:black_market/features/gold/presentation/view/widgets/blocs/get_coins_data_bloc_consumer.dart';
import 'package:black_market/features/gold/presentation/view_model/get_ingots_coins_data_cubit/get_ingots_coins_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoldCoinsSection extends StatelessWidget {
  const GoldCoinsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<GetIngotsCoinsDataCubit>().getIngotsCoinsData(),
      builder: (context, snapshot) => const GetCoinsDataBlocConsumer(),
    );
  }
}
