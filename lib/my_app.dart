import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/routing/app_router.dart';
import 'package:task/feature/delete_rosheta/data/repo/delete_rosheta_repo.dart';
import 'package:task/feature/delete_rosheta/prestentation/model_view/delete_rosheta_cubit.dart';
import 'package:task/feature/edit_rosheta/data/repo/edit_repo.dart';
import 'package:task/feature/edit_rosheta/presentation/model_view/edit_rosheta_cubit.dart';
import 'package:task/feature/get_rosheta/presentation/model_view/cubit/get_rosheta_cubit.dart';
import 'package:task/feature/upload_rosheta/data/repo/upload_repo.dart';
import 'package:task/feature/upload_rosheta/prestentation/model_view/upload_rosheta_cubit.dart';

import 'core/di/service_locator.dart';
import 'core/routing/routes.dart';
import 'feature/get_rosheta/data/repo/get_repo.dart';

class MyApp extends StatelessWidget {
  final AppRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetRoshetaCubit(sl<GetRepo>()),
        ),

        BlocProvider(
          create: (context) => UploadRoshetaCubit(sl<UploadRoshtaRepo>()),
        ),
        BlocProvider(
          create: (context) => EditRoshetaCubit(sl<EditRepo>()),
        ),
        BlocProvider(
          create: (context) => DeleteRoshetaCubit(sl<DeleteRoshetaRepo>()),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: router.generateRoute,
        initialRoute: Routes.home,
      ),
    );
  }
}
