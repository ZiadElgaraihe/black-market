import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log(change.toString());
    super.onChange(bloc, change);
  }
}
