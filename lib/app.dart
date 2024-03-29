import 'dart:math';

import 'package:black_market/core/data/repos/localization_repo.dart';
import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/data/services/local_database_services.dart';
import 'package:black_market/core/helpers/dio_helper.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:black_market/core/presentation/view_model/localization_cubit/localization_cubit.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/constants.dart';
import 'package:black_market/core/utils/service_locator.dart';
import 'package:black_market/features/notifications/data/repos/articles_repo.dart';
import 'package:black_market/features/notifications/data/repos/notifications_repo.dart';
import 'package:black_market/features/notifications/presentation/view_model/get_articles_cubit/get_articles_cubit.dart';
import 'package:black_market/features/notifications/presentation/view_model/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:black_market/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BlackMarket extends StatelessWidget {
  const BlackMarket({super.key});

  @override
  Widget build(BuildContext context) {
    isTablet = _checkForDeviceType(context);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColors.transparent,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(),
        ),
        BlocProvider<LocalizationCubit>(
          create: (context) => LocalizationCubit(
            localizationServices: LocalizationServices(
              localDatabaseServices: getIt<LocalDatabaseServices>(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => GetNotificationsCubit(
            connectionServices: getIt<ConnectionServices>(),
            notificationsServices: NotificationsServices(
              dioHelper: getIt<DioHelper>(),
            ),
          ),
        ),
        BlocProvider<GetArticlesCubit>(
          create: (context) => GetArticlesCubit(
            articlesServices: getIt<ArticlesServices>(),
            connectionServices: getIt<ConnectionServices>(),
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

  ///check if device is mobile or tablet using device's inches
  ///
  ///inches < 7 => mobile
  ///
  ///inches > 7 => tablet 
  bool _checkForDeviceType(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final width = screenSize.width;
    final height = screenSize.height;
    final diagonalInches = sqrt(width * width + height * height) / 160.0;
    return diagonalInches > 7;
  }
}
