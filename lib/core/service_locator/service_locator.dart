import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import './service_locator.config.dart';

final GetIt getIt = GetIt.instance;

// Use the [watch] flag to watch the files' system for edits and rebuild as necessary.
// dart run build_runner watch

// if you want the generator to run one time and exits use
// dart run build_runner build

@injectableInit
void setupLocator() async => getIt.init();
