import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/feature/get_rosheta/data/repo/get_repo.dart';

import '../../../data/model/get_model.dart';

part 'get_rosheta_state.dart';

class GetRoshetaCubit extends Cubit<GetRoshetaState> {
  final GetRepo getRepo;

  GetRoshetaCubit(this.getRepo) : super(GetRoshetaInitial());

  Future<void> getRosheta() async {
    emit(GetRoshetaLoading());
    final result = await getRepo.getRosheta();

    result.fold((fail) {
      print("Failed: $fail"); // Log failure

      emit(GetRoshetaError(fail));
    }, (success) {
      print("Success: $success"); // Log success

      emit(GetRoshetaSuccess(
        success
      ));
    });
  }
}
