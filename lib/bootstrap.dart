import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/core/utils/observers/bloc_observer.dart';
import 'package:flutter_demo/inject.dart';

/// Bootstrap the app with the given builder function
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  /// Run the app in a zone to catch all errors and log them to the console
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    Bloc.observer = const AppBlocObserver();

    /// Set the preferred orientations
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    /// Configure dependencies using injectable
    configureDependencies();

    /// Run the app with EasyLocalization
    runApp(await builder());
  }, (error, stack) {
    log(error.toString(), stackTrace: stack, name: 'bootstrap');
  });

  /// Log all errors to the console
  FlutterError.onError = (details) {
    log(
      details.exceptionAsString(),
      stackTrace: details.stack,
      name: 'FlutterError',
    );
  };
}
