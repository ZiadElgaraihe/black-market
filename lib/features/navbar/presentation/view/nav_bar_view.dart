import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/data/services/local_database_services.dart';
import 'package:black_market/core/helpers/dio_helper.dart';
import 'package:black_market/core/presentation/view_model/favourite_cubit/favourite_cubit.dart';
import 'package:black_market/core/utils/service_locator.dart';
import 'package:black_market/features/currency/data/repos/currency_repo.dart';
import 'package:black_market/features/currency/data/services/bank_services.dart';
import 'package:black_market/features/currency/presentation/view_model/currency_latest_cubit/currency_latest_cubit.dart';
import 'package:black_market/features/gold/data/repos/gold_repo.dart';
import 'package:black_market/features/gold/presentation/view_model/get_gold_data_cubit/get_gold_data_cubit.dart';
import 'package:black_market/features/gold/presentation/view_model/get_ingots_coins_data_cubit/get_ingots_coins_data_cubit.dart';
import 'package:black_market/features/navbar/presentation/view/widgets/default_nav_bar.dart';
import 'package:black_market/features/navbar/presentation/view/widgets/nav_bar_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _currentIndex.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CurrencyLatestCubit>(
          create: (context) => CurrencyLatestCubit(
            bankServices: BankServices(
              dioHelper: getIt<DioHelper>(),
            ),
            connectionServices: getIt<ConnectionServices>(),
            currencyServices: CurrencyServices(
              dioHelper: getIt<DioHelper>(),
            ),
            localDatabaseServices: getIt<LocalDatabaseServices>(),
          ),
        ),
        BlocProvider<FavouriteCubit>(
          create: (context) => FavouriteCubit(
            localDatabaseServices: getIt<LocalDatabaseServices>(),
          ),
        ),
        BlocProvider<GetGoldDataCubit>(
          create: (context) => GetGoldDataCubit(
            connectionServices: getIt<ConnectionServices>(),
            goldServices: GoldServices(
              dioHelper: getIt<DioHelper>(),
            ),
          ),
        ),
        BlocProvider<GetIngotsCoinsDataCubit>(
          create: (context) => GetIngotsCoinsDataCubit(
            connectionServices: getIt<ConnectionServices>(),
            goldServices: GoldServices(
              dioHelper: getIt<DioHelper>(),
            ),
          ),
        ),
      ],
      child: Scaffold(
        body: NavBarViewBody(
          currentIndexValueNotifier: _currentIndex,
          pageController: _pageController,
        ),
        bottomNavigationBar: DefaultNavBar(
          currentIndexValueNotifier: _currentIndex,
          pageController: _pageController,
        ),
      ),
    );
  }
}
