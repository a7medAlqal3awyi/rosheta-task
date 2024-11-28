import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'core/di/service_locator.dart';
import 'core/routing/app_router.dart';
import 'my_app.dart';

void main() {
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();

  runApp(MyApp(
    router: AppRouter(),
  ));
}
