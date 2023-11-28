import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/service_locator.dart';
import 'package:black_market/features/auth/data/services/auth_services.dart';
import 'package:black_market/features/auth/presentation/view_model/update_password_cubit/update_password_cubit.dart';
import 'package:black_market/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  //prevent app from being rotated
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      const BlackMarket(),
    );
  });
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
    return BlocProvider<UpdatePasswordCubit>(
      create: (context) => UpdatePasswordCubit(
        authServices: getIt<AuthServices>(),
        connectionServices: getIt<ConnectionServices>(),
      ),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Black Market',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: AppColors.backgroundColor,
            textTheme: GoogleFonts.almaraiTextTheme(
              ThemeData.dark().textTheme,
            ),
          ),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar'), // Arabic
            Locale('en'), // English
          ],
          locale: const Locale('ar'),
          home: const SplashView(),
        ),
      ),
    );
  }
}
