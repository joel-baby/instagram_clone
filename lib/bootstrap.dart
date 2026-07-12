import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:powersync_repository/powersync_repository.dart';
import 'package:shared/shared.dart';

typedef AppBuilder = FutureOr<Widget> Function(
  PowerSyncRepository,
);

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(
  AppBuilder builder, {
  required bool isDev,
}) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  // Add cross-flavor configuration here

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final powerSyncRepository = PowerSyncRepository(env: isDev);
      await powerSyncRepository.initialize();

      runApp(await builder(powerSyncRepository));
    },
    (error, stack) {
      logE(error.toString(), stackTrace: stack);
    },
  );
}
