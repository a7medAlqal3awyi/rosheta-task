import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/feature/delete_rosheta/data/repo/delete_rosheta_repo.dart';
import 'package:task/feature/delete_rosheta/prestentation/model_view/delete_rosheta_state.dart';

class DeleteRoshetaCubit extends Cubit<DeleteRoshtaState> {
  DeleteRoshetaCubit(this.repo) : super(DeleteRoshtaInitial());

  DeleteRoshetaRepo repo;

  Future<void> deleteRosheta() async {
    emit(DeleteRoshtaLoading());
    final result = await repo.deleteRoshtaRepo();

    result.fold(
      (fail) => emit(DeleteRoshtaError(fail)),
      (success) => emit(DeleteRoshtaSuccess(success)),
    );
  }
}
