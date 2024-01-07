import 'package:black_market/features/gold/presentation/view/widgets/blocs/get_gold_data_bloc_consumer.dart';
import 'package:black_market/features/gold/presentation/view_model/get_gold_data_cubit/get_gold_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoldSection extends StatelessWidget {
  const GoldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<GetGoldDataCubit>().getGoldData(),
      builder: (context, snapshot) => const GetGoldDataBlocConsumer(),
    );
  }
}
