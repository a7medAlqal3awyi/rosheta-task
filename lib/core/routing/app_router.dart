import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/routing/routes.dart';
import 'package:task/feature/get_rosheta/presentation/view/get_screen.dart';
import 'package:task/feature/home.dart';

import '../../feature/get_rosheta/data/repo/get_repo.dart';
import '../../feature/get_rosheta/presentation/model_view/cubit/get_rosheta_cubit.dart';
import '../../feature/upload_rosheta/prestentation/view/upload_screen.dart';
import '../di/service_locator.dart';

class AppRouter {
  final cubit = GetRoshetaCubit(sl<GetRepo>());

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.upload:
        return MaterialPageRoute(builder: (_) => const UploadScreen());
      case Routes.get:
        return MaterialPageRoute(builder: (_) => BlocProvider(

          create:(_)=>cubit ,
            child: const GetScreen()));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}
