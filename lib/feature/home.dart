import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/feature/delete_rosheta/data/repo/delete_rosheta_repo.dart';
import 'package:task/feature/delete_rosheta/prestentation/model_view/delete_rosheta_cubit.dart';
import 'package:task/feature/delete_rosheta/prestentation/model_view/delete_rosheta_state.dart';
import 'package:task/feature/edit_rosheta/data/repo/edit_repo.dart';
import 'package:task/feature/edit_rosheta/presentation/model_view/edit_rosheta_cubit.dart';
import 'package:task/feature/edit_rosheta/presentation/view/edit_screen.dart';
import 'package:task/feature/upload_rosheta/data/repo/upload_repo.dart';
import 'package:task/feature/upload_rosheta/prestentation/model_view/upload_rosheta_cubit.dart';
import 'package:task/feature/upload_rosheta/prestentation/view/upload_screen.dart';

import '../core/di/service_locator.dart';
import 'get_rosheta/data/repo/get_repo.dart';
import 'get_rosheta/presentation/model_view/cubit/get_rosheta_cubit.dart';
import 'get_rosheta/presentation/view/get_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              GestureDetector(
                onTap: () {
                  final cubit = GetRoshetaCubit(sl<GetRepo>());
                  cubit.getRosheta(); // Ensure getRosheta() is called here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => cubit,
                        child: const GetScreen(),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                  child: const Center(
                    child: Text(
                      'Get rosheta',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  final cubit = UploadRoshetaCubit(sl<UploadRoshtaRepo>());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => cubit,
                        child: const UploadScreen(),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                  child: const Center(
                    child: Text(
                      'upload',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  final cubit = EditRoshetaCubit(sl<EditRepo>());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => cubit,
                        child: const EditScreen(),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                  child: const Center(
                    child: Text(
                      'edit',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              BlocProvider(
                create: (context) =>
                    DeleteRoshetaCubit(sl<DeleteRoshetaRepo>()),
                child: BlocBuilder<DeleteRoshetaCubit, DeleteRoshtaState>(
                  builder: (context, state) {
                    if (state is DeleteRoshtaLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is DeleteRoshtaSuccess) {
                      return Center(
                        child: Text(
                          'Success: ${state.response.message}',
                          style: const TextStyle(
                              color: Colors.green, fontSize: 18),
                        ),
                      );
                    } else if (state is DeleteRoshtaError) {
                      return Center(
                        child: Text(
                          'Error: ${state.error}',
                          style:
                              const TextStyle(color: Colors.red, fontSize: 18),
                        ),
                      );
                    }

                    return GestureDetector(
                      onTap: () {
                        context.read<DeleteRoshetaCubit>().deleteRosheta();
                      },
                      child: Container(
                        width: 200,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                        ),
                        child: const Center(
                          child: Text(
                            'delete',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
