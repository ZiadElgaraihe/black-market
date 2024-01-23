import 'package:black_market/core/data/repos/localization_repo.dart';
import 'package:black_market/core/data/services/local_database_services.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:black_market/core/presentation/view_model/localization_cubit/localization_cubit.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/hive_setup.dart';
import 'package:black_market/core/utils/service_locator.dart';
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
        const BlackMarket(),
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
