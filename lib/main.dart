import 'package:black_market/app.dart';
import 'package:black_market/core/utils/default_bloc_observer.dart';
import 'package:black_market/core/utils/hive_setup.dart';
import 'package:black_market/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeLocalDatabase();
  setUpServiceLocator();
  Bloc.observer = DefaultBlocObserver();
  //prevent app from being rotated
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(
        const BlackMarket(),
      );
    },
  );
}
