import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/data/services/local_database_services.dart';
import 'package:black_market/core/data/services/secure_database_services.dart';
import 'package:black_market/core/helpers/dio_helper.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view_model/favourite_cubit/favourite_cubit.dart';
import 'package:black_market/core/presentation/view_model/localization_cubit/localization_cubit.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/hive_setup.dart';
import 'package:black_market/core/utils/service_locator.dart';
import 'package:black_market/features/auth/data/services/auth_services.dart';
import 'package:black_market/features/auth/presentation/view_model/update_password_cubit/update_password_cubit.dart';
import 'package:black_market/features/currency/data/repos/currency_repo.dart';
import 'package:black_market/features/currency/data/services/bank_services.dart';
import 'package:black_market/features/currency/presentation/view_model/currency_latest_cubit/currency_latest_cubit.dart';
import 'package:black_market/features/gold/data/repos/gold_repo.dart';
import 'package:black_market/features/gold/presentation/view_model/get_gold_data_cubit/get_gold_data_cubit.dart';
import 'package:black_market/features/gold/presentation/view_model/get_ingots_coins_data_cubit/get_ingots_coins_data_cubit.dart';
import 'package:black_market/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeLocalDatabase();
  setUpServiceLocator();
  //prevent app from being rotated
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(
        BlocProvider<LocalizationCubit>(
          create: (context) => LocalizationCubit(
            localDatabaseServices: getIt<LocalDatabaseServices>(),
          ),
          child: const BlackMarket(),
        ),
      );
    },
  );
}

class BlackMarket extends StatelessWidget {
  const BlackMarket({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColors.transparent,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<UpdatePasswordCubit>(
          create: (context) => UpdatePasswordCubit(
            authServices: getIt<AuthServices>(),
            connectionServices: getIt<ConnectionServices>(),
            localDatabaseServices: getIt<LocalDatabaseServices>(),
            secureDatabaseServices: getIt<SecureDatabaseServices>(),
          ),
        ),
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
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: BlocBuilder<LocalizationCubit, LocalizationState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Black Market',
              theme: ThemeData.dark(useMaterial3: false).copyWith(
                scaffoldBackgroundColor: AppColors.backgroundColor,
                textTheme: GoogleFonts.almaraiTextTheme(
                  ThemeData.dark().textTheme,
                ),
              ),
              localizationsDelegates: const [
                Tr.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: Tr.delegate.supportedLocales,
              locale: context.read<LocalizationCubit>().appLocale,
              home: const SplashView(),
            );
          },
        ),
      ),
    );
  }
}
