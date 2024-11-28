import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/feature/get_rosheta/presentation/model_view/cubit/get_rosheta_cubit.dart';

class GetScreen extends StatelessWidget {
  const GetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<GetRoshetaCubit, GetRoshetaState>(
          builder: (context, state) {
            print('State: $state'); // Debug print to check the current state
            if (state is GetRoshetaLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            else if (state is GetRoshetaSuccess) {
              final rosheta = state.getModel;
              print('Rosheta data: ${rosheta?.title}, ${rosheta?.terms}'); // Check data here
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        "Get one Rosheta",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      rosheta.title ,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      rosheta.terms ,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Image.network(rosheta.image[0]),

                    const SizedBox(height: 20),
                    Text("createdAt : ${rosheta.createdAt}"),
                    const SizedBox(height: 20),
                    Text("updatedAt: ${rosheta.updatedAt}"),
                  ],
                ),
              );
            } else if (state is GetRoshetaError) {
              return Center(
                child: Text(
                  "Error: ${state.error}",
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
            return const Center(
              child: Text("Press the button to load data"),
            );
          },
        )

      ),
    );
  }
}
